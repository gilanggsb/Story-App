// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) {
  return _BaseResponse.fromJson(json);
}

/// @nodoc
mixin _$BaseResponse {
  dynamic get data => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseResponseCopyWith<BaseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseResponseCopyWith<$Res> {
  factory $BaseResponseCopyWith(
          BaseResponse value, $Res Function(BaseResponse) then) =
      _$BaseResponseCopyWithImpl<$Res, BaseResponse>;
  @useResult
  $Res call({dynamic data, String message, bool error});
}

/// @nodoc
class _$BaseResponseCopyWithImpl<$Res, $Val extends BaseResponse>
    implements $BaseResponseCopyWith<$Res> {
  _$BaseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaseResponseImplCopyWith<$Res>
    implements $BaseResponseCopyWith<$Res> {
  factory _$$BaseResponseImplCopyWith(
          _$BaseResponseImpl value, $Res Function(_$BaseResponseImpl) then) =
      __$$BaseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic data, String message, bool error});
}

/// @nodoc
class __$$BaseResponseImplCopyWithImpl<$Res>
    extends _$BaseResponseCopyWithImpl<$Res, _$BaseResponseImpl>
    implements _$$BaseResponseImplCopyWith<$Res> {
  __$$BaseResponseImplCopyWithImpl(
      _$BaseResponseImpl _value, $Res Function(_$BaseResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = null,
    Object? error = null,
  }) {
    return _then(_$BaseResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseResponseImpl implements _BaseResponse {
  const _$BaseResponseImpl(
      {required this.data, required this.message, required this.error});

  factory _$BaseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseResponseImplFromJson(json);

  @override
  final dynamic data;
  @override
  final String message;
  @override
  final bool error;

  @override
  String toString() {
    return 'BaseResponse(data: $data, message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseResponseImpl &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), message, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseResponseImplCopyWith<_$BaseResponseImpl> get copyWith =>
      __$$BaseResponseImplCopyWithImpl<_$BaseResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseResponseImplToJson(
      this,
    );
  }
}

abstract class _BaseResponse implements BaseResponse {
  const factory _BaseResponse(
      {required final dynamic data,
      required final String message,
      required final bool error}) = _$BaseResponseImpl;

  factory _BaseResponse.fromJson(Map<String, dynamic> json) =
      _$BaseResponseImpl.fromJson;

  @override
  dynamic get data;
  @override
  String get message;
  @override
  bool get error;
  @override
  @JsonKey(ignore: true)
  _$$BaseResponseImplCopyWith<_$BaseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
