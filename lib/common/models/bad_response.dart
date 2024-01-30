import 'package:freezed_annotation/freezed_annotation.dart';

part 'bad_response.g.dart';
part 'bad_response.freezed.dart';

@freezed
class BadResponse with _$BadResponse {
  const factory BadResponse({
    final bool? error,
    final String? message,
  }) = _BadResponse;

  factory BadResponse.fromJson(Map<String, dynamic> json) =>
      _$BadResponseFromJson(json);
}
