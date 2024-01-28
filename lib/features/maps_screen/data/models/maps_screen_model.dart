// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';
part 'maps_screen_model.g.dart';
part 'maps_screen_model.freezed.dart';

@freezed
class MapsScreenModel with _$MapsScreenModel {
  @JsonSerializable()
  const factory MapsScreenModel({
    @JsonKey(
      fromJson: MapsScreenModel.latLngFromJson,
      toJson: MapsScreenModel.latLngToJson,
    )
    final LatLng? latLng,
    required final bool isPreviewMode,
  }) = _MapScreenModel;
  factory MapsScreenModel.fromJson(Map<String, dynamic> json) =>
      _$MapsScreenModelFromJson(json);

  static LatLng? latLngFromJson(Map<String, dynamic>? json) =>
      json != null ? LatLng.fromJson(json) : null;
  static Map<String, dynamic>? latLngToJson(LatLng? latLng) => latLng?.toJson();
}
