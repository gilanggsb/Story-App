import 'package:freezed_annotation/freezed_annotation.dart';

part 'req_login_model.g.dart';
part 'req_login_model.freezed.dart';

@freezed
class ReqLoginModel with _$ReqLoginModel {
  const factory ReqLoginModel({
    required final String? email,
    final String? password,
  }) = _ReqLoginModel;

  factory ReqLoginModel.fromJson(Map<String, dynamic> json) =>
      _$ReqLoginModelFromJson(json);
}
