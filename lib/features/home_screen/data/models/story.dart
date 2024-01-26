// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
part 'story.g.dart';
part 'story.freezed.dart';

// Story storyFromJson(String str) => Story.fromJson(json.decode(str));

// String storyToJson(Story data) => json.encode(data.toJson());

// class Story {
//   final String? id;
//   final String? name;
//   final String? description;
//   final String? photoUrl;
//   final DateTime? createdAt;
//   final double? lat;
//   final double? lon;

//   Story({
//     this.id,
//     this.name,
//     this.description,
//     this.photoUrl,
//     this.createdAt,
//     this.lat,
//     this.lon,
//   });

//   factory Story.fromJson(Map<String, dynamic> json) => Story(
//         id: json["id"],
//         name: json["name"],
//         description: json["description"],
//         photoUrl: json["photoUrl"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         lat: json["lat"]?.toDouble(),
//         lon: json["lon"]?.toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "description": description,
//         "photoUrl": photoUrl,
//         "createdAt": createdAt?.toIso8601String(),
//         "lat": lat,
//         "lon": lon,
//       };
// }

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
  // static Map<String,dynamic> toJson(Placemark json) => ;
}
