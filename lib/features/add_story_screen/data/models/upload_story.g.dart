// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadStoryImpl _$$UploadStoryImplFromJson(Map<String, dynamic> json) =>
    _$UploadStoryImpl(
      file: const XFileConverter().fromJson(json['file'] as String?),
      description: json['description'] as String,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UploadStoryImplToJson(_$UploadStoryImpl instance) =>
    <String, dynamic>{
      'file': const XFileConverter().toJson(instance.file),
      'description': instance.description,
      'lat': instance.lat,
      'lon': instance.lon,
    };
