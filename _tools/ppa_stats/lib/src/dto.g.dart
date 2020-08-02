// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishedBinaryResponse _$PublishedBinaryResponseFromJson(
    Map<String, dynamic> json) {
  return PublishedBinaryResponse(
    entries: (json['entries'] as List)
        .map((e) => PublishedBinary.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PublishedBinaryResponseToJson(
        PublishedBinaryResponse instance) =>
    <String, dynamic>{
      'entries': instance.entries,
    };

PublishedBinary _$PublishedBinaryFromJson(Map<String, dynamic> json) {
  return PublishedBinary(
    selfLink: json['self_link'] as String,
    displayName: json['display_name'] as String,
    binaryPackageVersion: json['binary_package_version'] as String,
  );
}

Map<String, dynamic> _$PublishedBinaryToJson(PublishedBinary instance) =>
    <String, dynamic>{
      'self_link': instance.selfLink,
      'display_name': instance.displayName,
      'binary_package_version': instance.binaryPackageVersion,
    };
