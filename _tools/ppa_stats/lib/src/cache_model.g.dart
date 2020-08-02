// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadStatCache _$DownloadStatCacheFromJson(Map<String, dynamic> json) {
  return DownloadStatCache(
    stats: (json['stats'] as List)
        .map((e) => DownloadStat.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DownloadStatCacheToJson(DownloadStatCache instance) =>
    <String, dynamic>{
      'stats': instance.stats,
    };

DownloadStat _$DownloadStatFromJson(Map<String, dynamic> json) {
  return DownloadStat(
    fetched: DateTime.parse(json['fetched'] as String),
    totalDownloads: json['totalDownloads'] as int,
    downloadCount: Map<String, int>.from(json['downloadCount'] as Map),
  );
}

Map<String, dynamic> _$DownloadStatToJson(DownloadStat instance) =>
    <String, dynamic>{
      'fetched': instance.fetched.toIso8601String(),
      'totalDownloads': instance.totalDownloads,
      'downloadCount': instance.downloadCount,
    };
