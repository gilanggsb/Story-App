import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import '../../../common/common.dart';
import '../data/data.dart';

abstract class Disposable {
  void dispose();
}

class MapsProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService.instance;
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;
  final MapsRepository _mapsRepository = MapsRepository.instance;
  late LatLong latLong;
  late Placemark? placemark;
  static MapsProvider? _instance;

  MapsProvider._();

  static MapsProvider get instance => _instance ??= MapsProvider._();

  void getCurrentLocation(LatLong latLong) async {
    try {
      // showLoading();
      _mapsRepository.getLocation(latLong);

      // Story detailStory = await _detailStoryRepository
      //     .getStory(_myRouter.routeParamsModel?.params ?? '');
      // story = detailStory;

      notifyListeners();
    } on String catch (e) {
      _myRouter.showSnackbar(e);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong $e');
    } finally {
      // dismissLoading();
    }
  }
}
