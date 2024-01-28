// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maps_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapsScreenModel _$MapsScreenModelFromJson(Map<String, dynamic> json) {
  return _MapScreenModel.fromJson(json);
}

/// @nodoc
mixin _$MapsScreenModel {
  @JsonKey(
      fromJson: MapsScreenModel.latLngFromJson,
      toJson: MapsScreenModel.latLngToJson)
  LatLng? get latLng => throw _privateConstructorUsedError;
  bool get isPreviewMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapsScreenModelCopyWith<MapsScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapsScreenModelCopyWith<$Res> {
  factory $MapsScreenModelCopyWith(
          MapsScreenModel value, $Res Function(MapsScreenModel) then) =
      _$MapsScreenModelCopyWithImpl<$Res, MapsScreenModel>;
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: MapsScreenModel.latLngFromJson,
          toJson: MapsScreenModel.latLngToJson)
      LatLng? latLng,
      bool isPreviewMode});
}

/// @nodoc
class _$MapsScreenModelCopyWithImpl<$Res, $Val extends MapsScreenModel>
    implements $MapsScreenModelCopyWith<$Res> {
  _$MapsScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLng = freezed,
    Object? isPreviewMode = null,
  }) {
    return _then(_value.copyWith(
      latLng: freezed == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      isPreviewMode: null == isPreviewMode
          ? _value.isPreviewMode
          : isPreviewMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapScreenModelImplCopyWith<$Res>
    implements $MapsScreenModelCopyWith<$Res> {
  factory _$$MapScreenModelImplCopyWith(_$MapScreenModelImpl value,
          $Res Function(_$MapScreenModelImpl) then) =
      __$$MapScreenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          fromJson: MapsScreenModel.latLngFromJson,
          toJson: MapsScreenModel.latLngToJson)
      LatLng? latLng,
      bool isPreviewMode});
}

/// @nodoc
class __$$MapScreenModelImplCopyWithImpl<$Res>
    extends _$MapsScreenModelCopyWithImpl<$Res, _$MapScreenModelImpl>
    implements _$$MapScreenModelImplCopyWith<$Res> {
  __$$MapScreenModelImplCopyWithImpl(
      _$MapScreenModelImpl _value, $Res Function(_$MapScreenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLng = freezed,
    Object? isPreviewMode = null,
  }) {
    return _then(_$MapScreenModelImpl(
      latLng: freezed == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      isPreviewMode: null == isPreviewMode
          ? _value.isPreviewMode
          : isPreviewMode // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$MapScreenModelImpl implements _MapScreenModel {
  const _$MapScreenModelImpl(
      {@JsonKey(
          fromJson: MapsScreenModel.latLngFromJson,
          toJson: MapsScreenModel.latLngToJson)
      this.latLng,
      required this.isPreviewMode});

  factory _$MapScreenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapScreenModelImplFromJson(json);

  @override
  @JsonKey(
      fromJson: MapsScreenModel.latLngFromJson,
      toJson: MapsScreenModel.latLngToJson)
  final LatLng? latLng;
  @override
  final bool isPreviewMode;

  @override
  String toString() {
    return 'MapsScreenModel(latLng: $latLng, isPreviewMode: $isPreviewMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapScreenModelImpl &&
            (identical(other.latLng, latLng) || other.latLng == latLng) &&
            (identical(other.isPreviewMode, isPreviewMode) ||
                other.isPreviewMode == isPreviewMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latLng, isPreviewMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapScreenModelImplCopyWith<_$MapScreenModelImpl> get copyWith =>
      __$$MapScreenModelImplCopyWithImpl<_$MapScreenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapScreenModelImplToJson(
      this,
    );
  }
}

abstract class _MapScreenModel implements MapsScreenModel {
  const factory _MapScreenModel(
      {@JsonKey(
          fromJson: MapsScreenModel.latLngFromJson,
          toJson: MapsScreenModel.latLngToJson)
      final LatLng? latLng,
      required final bool isPreviewMode}) = _$MapScreenModelImpl;

  factory _MapScreenModel.fromJson(Map<String, dynamic> json) =
      _$MapScreenModelImpl.fromJson;

  @override
  @JsonKey(
      fromJson: MapsScreenModel.latLngFromJson,
      toJson: MapsScreenModel.latLngToJson)
  LatLng? get latLng;
  @override
  bool get isPreviewMode;
  @override
  @JsonKey(ignore: true)
  _$$MapScreenModelImplCopyWith<_$MapScreenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
