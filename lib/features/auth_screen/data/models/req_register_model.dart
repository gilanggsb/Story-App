import 'package:freezed_annotation/freezed_annotation.dart';
part 'req_register_model.g.dart';
part 'req_register_model.freezed.dart';

@freezed
class ReqRegisterModel with _$ReqRegisterModel {
  const factory ReqRegisterModel({
    final String? name,
    final String? email,
    final String? password,
  }) = _ReqRegisterModel;

  factory ReqRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$ReqRegisterModelFromJson(json);
}
