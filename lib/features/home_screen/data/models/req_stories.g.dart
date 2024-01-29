// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'req_stories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReqStoriesImpl _$$ReqStoriesImplFromJson(Map<String, dynamic> json) =>
    _$ReqStoriesImpl(
      page: json['page'] as int?,
      size: json['size'] as int?,
      location: json['location'] as int? ?? 0,
    );

Map<String, dynamic> _$$ReqStoriesImplToJson(_$ReqStoriesImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'location': instance.location,
    };
