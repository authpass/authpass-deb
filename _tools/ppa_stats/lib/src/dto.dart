import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';

@JsonSerializable(nullable: false)
class PublishedBinaryResponse {
  PublishedBinaryResponse({
    this.entries,
  });
  factory PublishedBinaryResponse.fromJson(Map<String, dynamic> json) =>
      _$PublishedBinaryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PublishedBinaryResponseToJson(this);

  final List<PublishedBinary> entries;
}

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PublishedBinary {
  PublishedBinary({
    this.selfLink,
    this.displayName,
    this.binaryPackageVersion,
  });
  factory PublishedBinary.fromJson(Map<String, dynamic> json) =>
      _$PublishedBinaryFromJson(json);
  Map<String, dynamic> toJson() => _$PublishedBinaryToJson(this);

  final String selfLink;
  final String displayName;
  final String binaryPackageVersion;
}
