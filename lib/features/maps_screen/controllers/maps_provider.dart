import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import '../../../common/common.dart';
import '../data/data.dart';

abstract class Disposable {
  void dispose();
}

class MapsProvider extends ChangeNotifier {
  late final MapController mapController;
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;
  final MapsRepository _mapsRepository = MapsRepository.instance;
  LatLng latLong = const LatLng(50.5, 30.51);
  Placemark? placemark;

  MapsProvider() {
    mapController = MapController();
  }

  void getCurrentLocation(LatLng latLong) async {
    try {
      showLoading();
      placemark = await _mapsRepository.getLocation(latLong);
      notifyListeners();
    } on String catch (e) {
      _myRouter.showSnackbar(e);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong $e');
    } finally {
      dismissLoading();
    }
  }

  void getUserLocation() async {
    try {
      showLoading();
      final (resPlacemark, resLatlng) = await _mapsRepository.getUserLocation();
      placemark = resPlacemark;
      latLong = resLatlng;
      mapController.fitCamera(CameraFit.coordinates(coordinates: [latLong]));
      notifyListeners();
    } on String catch (e) {
      _myRouter.showSnackbar(e);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong $e');
    } finally {
      dismissLoading();
    }
  }

  void onMapChanged(pickedData) {
    if (pickedData == null) return;
    // pickData = pickedData;
    notifyListeners();
  }

  void saveLocation() {
    globalContext?.pop((placemark, latLong));
  }
}
