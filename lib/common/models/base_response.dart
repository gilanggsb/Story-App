import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@freezed
class BaseResponse with _$BaseResponse {
  const factory BaseResponse({
    required final dynamic data,
    required final String message,
    required final bool error,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(Map<String, dynamic> json, String? dataKey) =>
      BaseResponse(
        message: json["message"] ?? "",
        data: json[dataKey] ?? "",
        error: json["error"] ?? "",
      );
}
