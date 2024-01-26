import 'package:flutter/material.dart';
import '../../../common/common.dart';
import '../data/data.dart';

abstract class Disposable {
  void dispose();
}

class MapsProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService.instance;
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;
  final MapsRepository _mapsRepository = MapsRepository.instance;
  int? pageItems = 1;
  int sizeItems = 10;
  // List<Story> stories = [];

  static MapsProvider? _instance;

  MapsProvider._();

  static MapsProvider get instance => _instance ??= MapsProvider._();

  void getCurrentLocation() async {
    try {
      // showLoading();
      // print(
      //   "🚀 ~ MapsProvider ~ voidgetCurrentLocation ~ _myRouter.routeParamsModel?.params: ${_myRouter.routeParamsModel?.params}",
      // );

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
