// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MapScreenModelImpl _$$MapScreenModelImplFromJson(Map<String, dynamic> json) =>
    _$MapScreenModelImpl(
      latLng: MapsScreenModel.latLngFromJson(
          json['latLng'] as Map<String, dynamic>?),
      isPreviewMode: json['isPreviewMode'] as bool,
    );

Map<String, dynamic> _$$MapScreenModelImplToJson(
        _$MapScreenModelImpl instance) =>
    <String, dynamic>{
      'latLng': MapsScreenModel.latLngToJson(instance.latLng),
      'isPreviewMode': instance.isPreviewMode,
    };
