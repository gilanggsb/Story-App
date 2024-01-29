// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'req_stories.g.dart';
part 'req_stories.freezed.dart';

@freezed
class ReqStories with _$ReqStories {
  @JsonSerializable()
  const factory ReqStories({
    final int? page,
    final int? size,
    @JsonKey(defaultValue: 0) final int? location,
  }) = _ReqStories;

  factory ReqStories.fromJson(Map<String, dynamic> json) =>
      _$ReqStoriesFromJson(json);
}
