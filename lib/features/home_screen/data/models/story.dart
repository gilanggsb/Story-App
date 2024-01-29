// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
part 'story.g.dart';
part 'story.freezed.dart';

@freezed
class Story with _$Story {
  @JsonSerializable()
  const factory Story({
    final String? id,
    final String? name,
    final String? description,
    final String? photoUrl,
    final DateTime? createdAt,
    final double? lat,
    final double? lon,
    @JsonKey(
      fromJson: Story.placemarkFromJson,
      toJson: Story.placemarkToJson,
    )
    final Placemark? placemark,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

  static Placemark? placemarkFromJson(Map<String, dynamic>? json) =>
      json != null ? Placemark.fromMap(json) : null;
  static Map<String, dynamic>? placemarkToJson(Placemark? placemark) =>
      placemark?.toJson();
}
