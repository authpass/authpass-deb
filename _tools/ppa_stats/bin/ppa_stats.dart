import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';
import 'package:ppa_stats/ppa_stats.dart';

const urlBase = 'https://api.launchpad.net/devel';

final _logger = Logger('ppa_stats');

final cacheFile = File('ppa_stats.cache.json');

Future<void> main(List<String> arguments) async {
  PrintAppender.setupLogging();
  final api = LaunchpadApi();
  try {
    final stats = cacheFile.existsSync()
        ? DownloadStatCache.fromJson(
            json.decode(await cacheFile.readAsString()))
        : DownloadStatCache(stats: []);
    final binaries = await api.getPublishedBinaries();
    final binaryDownloadCount = <String, int>{};
    var total = 0;
    for (final binary in binaries) {
      _logger.fine(
          'Binary: ${binary.displayName} (${binary.binaryPackageVersion})');
      final downloadCount = await api.getDownloadCount(binary);
      _logger.fine('   download count: $downloadCount');
      binaryDownloadCount[binary.displayName] = downloadCount;
      total += downloadCount;
    }
    final toSave = DownloadStatCache(stats: [
      ...stats.stats,
      DownloadStat(
        fetched: DateTime.now().toUtc(),
        totalDownloads: total,
        downloadCount: binaryDownloadCount,
      )
    ]);
    final encoder = JsonEncoder.withIndent('  ');
    await cacheFile.writeAsString(encoder.convert(toSave.toJson()));

    final token = await File('../../secrets/artifact_token.txt').readAsString();
    final response = await post(
      'https://data.authpass.app/data/artifact.push',
      body: {
        'token': token.trim(),
        'metrics': json.encode({
          'ppa': toSave.stats.last.toJson(),
          'stats': null,
        }),
      },
    );
    print(response.statusCode);
    print(response.body);
  } finally {
    api.dispose();
  }
}

class LaunchpadApi {
  final _client = Client();

  Future<List<PublishedBinary>> getPublishedBinaries() async {
    final response =
        await _client.get('$urlBase/~codeux.design/+archive/ubuntu/authpass'
            '?ws.op=getPublishedBinaries');
    final parsed =
        PublishedBinaryResponse.fromJson(json.decode(_success(response)));
    return parsed.entries;
  }

  Future<int> getDownloadCount(PublishedBinary binary) async {
    final response =
        await _client.get(binary.selfLink + '?ws.op=getDownloadCount');
    return int.parse(_success(response));
  }

  String _success(Response response) {
    if (response.statusCode < 200 || response.statusCode > 299) {
      final error = 'Error http response. Code: ${response.statusCode}'
          ' for ${response.request.url}';
      _logger.severe(error);
      _logger.severe('body: ${response.body}');
      throw StateError(error);
    }
    return response.body;
  }

  void dispose() {
    _client.close();
  }
}
