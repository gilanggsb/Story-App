// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
part 'upload_story.freezed.dart';
part 'upload_story.g.dart';

@freezed
class UploadStory with _$UploadStory {
  @JsonSerializable(explicitToJson: true)
  const factory UploadStory({
    @XFileConverter() required final XFile file,
    @JsonKey() required final String description,
    @JsonKey() final double? lat,
    @JsonKey() final double? lon,
  }) = _UploadStory;

  factory UploadStory.fromJson(Map<String, dynamic> json) =>
      _$UploadStoryFromJson(json);
}

class XFileConverter implements JsonConverter<XFile, String?> {
  const XFileConverter();

  @override
  XFile fromJson(String? json) {
    // Convert the JSON string back to XFile.
    // You might need to adjust this based on the actual structure of the JSON data.
    // For simplicity, I'll assume XFile has a constructor that accepts a string.
    return XFile(json ?? '');
  }

  @override
  String? toJson(XFile xfile) {
    // Convert XFile to a string representation for JSON serialization.
    // You might need to adjust this based on the actual structure of XFile.
    // For simplicity, I'll assume XFile has a method `path` that returns a string.
    return xfile.path;
  }
}
