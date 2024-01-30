// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bad_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BadResponse _$BadResponseFromJson(Map<String, dynamic> json) {
  return _BadResponse.fromJson(json);
}

/// @nodoc
mixin _$BadResponse {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadResponseCopyWith<BadResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadResponseCopyWith<$Res> {
  factory $BadResponseCopyWith(
          BadResponse value, $Res Function(BadResponse) then) =
      _$BadResponseCopyWithImpl<$Res, BadResponse>;
  @useResult
  $Res call({bool? error, String? message});
}

/// @nodoc
class _$BadResponseCopyWithImpl<$Res, $Val extends BadResponse>
    implements $BadResponseCopyWith<$Res> {
  _$BadResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BadResponseImplCopyWith<$Res>
    implements $BadResponseCopyWith<$Res> {
  factory _$$BadResponseImplCopyWith(
          _$BadResponseImpl value, $Res Function(_$BadResponseImpl) then) =
      __$$BadResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? error, String? message});
}

/// @nodoc
class __$$BadResponseImplCopyWithImpl<$Res>
    extends _$BadResponseCopyWithImpl<$Res, _$BadResponseImpl>
    implements _$$BadResponseImplCopyWith<$Res> {
  __$$BadResponseImplCopyWithImpl(
      _$BadResponseImpl _value, $Res Function(_$BadResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_$BadResponseImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadResponseImpl implements _BadResponse {
  const _$BadResponseImpl({this.error, this.message});

  factory _$BadResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadResponseImplFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;

  @override
  String toString() {
    return 'BadResponse(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadResponseImplCopyWith<_$BadResponseImpl> get copyWith =>
      __$$BadResponseImplCopyWithImpl<_$BadResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BadResponseImplToJson(
      this,
    );
  }
}

abstract class _BadResponse implements BadResponse {
  const factory _BadResponse({final bool? error, final String? message}) =
      _$BadResponseImpl;

  factory _BadResponse.fromJson(Map<String, dynamic> json) =
      _$BadResponseImpl.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$BadResponseImplCopyWith<_$BadResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
