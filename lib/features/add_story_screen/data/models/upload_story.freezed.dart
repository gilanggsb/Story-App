// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadStory _$UploadStoryFromJson(Map<String, dynamic> json) {
  return _UploadStory.fromJson(json);
}

/// @nodoc
mixin _$UploadStory {
  @XFileConverter()
  XFile get file => throw _privateConstructorUsedError;
  @JsonKey()
  String get description => throw _privateConstructorUsedError;
  @JsonKey()
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey()
  double? get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadStoryCopyWith<UploadStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadStoryCopyWith<$Res> {
  factory $UploadStoryCopyWith(
          UploadStory value, $Res Function(UploadStory) then) =
      _$UploadStoryCopyWithImpl<$Res, UploadStory>;
  @useResult
  $Res call(
      {@XFileConverter() XFile file,
      @JsonKey() String description,
      @JsonKey() double? lat,
      @JsonKey() double? lon});
}

/// @nodoc
class _$UploadStoryCopyWithImpl<$Res, $Val extends UploadStory>
    implements $UploadStoryCopyWith<$Res> {
  _$UploadStoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? description = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadStoryImplCopyWith<$Res>
    implements $UploadStoryCopyWith<$Res> {
  factory _$$UploadStoryImplCopyWith(
          _$UploadStoryImpl value, $Res Function(_$UploadStoryImpl) then) =
      __$$UploadStoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@XFileConverter() XFile file,
      @JsonKey() String description,
      @JsonKey() double? lat,
      @JsonKey() double? lon});
}

/// @nodoc
class __$$UploadStoryImplCopyWithImpl<$Res>
    extends _$UploadStoryCopyWithImpl<$Res, _$UploadStoryImpl>
    implements _$$UploadStoryImplCopyWith<$Res> {
  __$$UploadStoryImplCopyWithImpl(
      _$UploadStoryImpl _value, $Res Function(_$UploadStoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? description = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$UploadStoryImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as XFile,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UploadStoryImpl implements _UploadStory {
  const _$UploadStoryImpl(
      {@XFileConverter() required this.file,
      @JsonKey() required this.description,
      @JsonKey() this.lat,
      @JsonKey() this.lon});

  factory _$UploadStoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadStoryImplFromJson(json);

  @override
  @XFileConverter()
  final XFile file;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final double? lat;
  @override
  @JsonKey()
  final double? lon;

  @override
  String toString() {
    return 'UploadStory(file: $file, description: $description, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadStoryImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, file, description, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadStoryImplCopyWith<_$UploadStoryImpl> get copyWith =>
      __$$UploadStoryImplCopyWithImpl<_$UploadStoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadStoryImplToJson(
      this,
    );
  }
}

abstract class _UploadStory implements UploadStory {
  const factory _UploadStory(
      {@XFileConverter() required final XFile file,
      @JsonKey() required final String description,
      @JsonKey() final double? lat,
      @JsonKey() final double? lon}) = _$UploadStoryImpl;

  factory _UploadStory.fromJson(Map<String, dynamic> json) =
      _$UploadStoryImpl.fromJson;

  @override
  @XFileConverter()
  XFile get file;
  @override
  @JsonKey()
  String get description;
  @override
  @JsonKey()
  double? get lat;
  @override
  @JsonKey()
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$UploadStoryImplCopyWith<_$UploadStoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
