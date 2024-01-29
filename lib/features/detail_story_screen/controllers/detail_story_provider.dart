import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:story_app/common/common.dart';
import 'package:story_app/features/detail_story_screen/data/detail_story_repository.dart';

import '../../home_screen/data/data.dart';
import '../../maps_screen/data/models/maps_screen_model.dart';

class DetailStoryProvider extends ChangeNotifier {
  final DetailStoryRepository _detailStoryRepository = DetailStoryRepository();
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;
  Story? story;

  void getDetailStory(String storyId) async {
    try {
      showLoading();
      Story detailStory = await _detailStoryRepository.getStory(storyId);
      story = detailStory;

      notifyListeners();
    } on String catch (e) {
      _myRouter.showSnackbar(e);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong $e');
    } finally {
      dismissLoading();
    }
  }

  void openMaps() async {
    await Geolocator.requestPermission();
    if (story?.lat == null && story?.lon == null) return;
    globalContext?.pushNamed(
      RouteName.mapsScreen.name,
      extra: MapsScreenModel(
        latLng: LatLng(story?.lat ?? 0, story?.lon ?? 0),
        isPreviewMode: true,
      ),
    );
  }
}
