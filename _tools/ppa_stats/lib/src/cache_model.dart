import 'package:json_annotation/json_annotation.dart';

part 'cache_model.g.dart';

@JsonSerializable(nullable: false)
class DownloadStatCache {
  DownloadStatCache({
    this.stats,
  });
  factory DownloadStatCache.fromJson(Map<String, dynamic> json) =>
      _$DownloadStatCacheFromJson(json);
  Map<String, dynamic> toJson() => _$DownloadStatCacheToJson(this);

  final List<DownloadStat> stats;
}

@JsonSerializable(nullable: false)
class DownloadStat {
  DownloadStat({
    this.fetched,
    this.totalDownloads,
    this.downloadCount,
  });
  factory DownloadStat.fromJson(Map<String, dynamic> json) =>
      _$DownloadStatFromJson(json);
  Map<String, dynamic> toJson() => _$DownloadStatToJson(this);

  final DateTime fetched;
  final int totalDownloads;
  final Map<String, int> downloadCount;
}
