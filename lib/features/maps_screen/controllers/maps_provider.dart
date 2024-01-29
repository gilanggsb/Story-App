import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:story_app/features/home_screen/controllers/controllers.dart';
import '../../../common/common.dart';
import '../data/data.dart';

abstract class Disposable {
  void dispose();
}

class MapsProvider extends ChangeNotifier {
  late final MapController mapController;
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;
  final MapsRepository _mapsRepository = MapsRepository.instance;
  final HomeProvider homeProvider = HomeProvider.instance;
  LatLng? latLong;
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
      mapController.fitCamera(CameraFit.coordinates(coordinates: [resLatlng]));
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
    homeProvider.clearStories();
    Timer(const Duration(milliseconds: 500), () {
      globalContext?.pop((placemark, latLong));
    });
  }
}
