import 'package:flutter/material.dart';
import 'package:story_app/common/common.dart';
import 'package:story_app/features/detail_story_screen/data/detail_story_repository.dart';

import '../../home_screen/data/data.dart';

class DetailStoryProvider extends ChangeNotifier {
  final DetailStoryRepository _detailStoryRepository = DetailStoryRepository();
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;
  Story? story;

  void getDetailStory() async {
    try {
      showLoading();
      Story detailStory = await _detailStoryRepository
          .getStory(_myRouter.routeParamsModel?.params ?? '');
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
}
