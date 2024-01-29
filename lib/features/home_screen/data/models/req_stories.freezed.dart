// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'req_stories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReqStories _$ReqStoriesFromJson(Map<String, dynamic> json) {
  return _ReqStories.fromJson(json);
}

/// @nodoc
mixin _$ReqStories {
  int? get page => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: 0)
  int? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReqStoriesCopyWith<ReqStories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReqStoriesCopyWith<$Res> {
  factory $ReqStoriesCopyWith(
          ReqStories value, $Res Function(ReqStories) then) =
      _$ReqStoriesCopyWithImpl<$Res, ReqStories>;
  @useResult
  $Res call({int? page, int? size, @JsonKey(defaultValue: 0) int? location});
}

/// @nodoc
class _$ReqStoriesCopyWithImpl<$Res, $Val extends ReqStories>
    implements $ReqStoriesCopyWith<$Res> {
  _$ReqStoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReqStoriesImplCopyWith<$Res>
    implements $ReqStoriesCopyWith<$Res> {
  factory _$$ReqStoriesImplCopyWith(
          _$ReqStoriesImpl value, $Res Function(_$ReqStoriesImpl) then) =
      __$$ReqStoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? page, int? size, @JsonKey(defaultValue: 0) int? location});
}

/// @nodoc
class __$$ReqStoriesImplCopyWithImpl<$Res>
    extends _$ReqStoriesCopyWithImpl<$Res, _$ReqStoriesImpl>
    implements _$$ReqStoriesImplCopyWith<$Res> {
  __$$ReqStoriesImplCopyWithImpl(
      _$ReqStoriesImpl _value, $Res Function(_$ReqStoriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? location = freezed,
  }) {
    return _then(_$ReqStoriesImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ReqStoriesImpl implements _ReqStories {
  const _$ReqStoriesImpl(
      {this.page, this.size, @JsonKey(defaultValue: 0) this.location});

  factory _$ReqStoriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReqStoriesImplFromJson(json);

  @override
  final int? page;
  @override
  final int? size;
  @override
  @JsonKey(defaultValue: 0)
  final int? location;

  @override
  String toString() {
    return 'ReqStories(page: $page, size: $size, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReqStoriesImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, size, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReqStoriesImplCopyWith<_$ReqStoriesImpl> get copyWith =>
      __$$ReqStoriesImplCopyWithImpl<_$ReqStoriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReqStoriesImplToJson(
      this,
    );
  }
}

abstract class _ReqStories implements ReqStories {
  const factory _ReqStories(
      {final int? page,
      final int? size,
      @JsonKey(defaultValue: 0) final int? location}) = _$ReqStoriesImpl;

  factory _ReqStories.fromJson(Map<String, dynamic> json) =
      _$ReqStoriesImpl.fromJson;

  @override
  int? get page;
  @override
  int? get size;
  @override
  @JsonKey(defaultValue: 0)
  int? get location;
  @override
  @JsonKey(ignore: true)
  _$$ReqStoriesImplCopyWith<_$ReqStoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
