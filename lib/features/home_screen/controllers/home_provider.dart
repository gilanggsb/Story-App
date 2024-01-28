import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/common.dart';
import '../data/data.dart';

abstract class Disposable {
  void dispose();
}

class HomeProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService.instance;
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;
  final HomeRepository _homeRepository = HomeRepository();
  int? pageItems = 1;
  int sizeItems = 10;
  List<Story> stories = [];

  static HomeProvider? _instance;

  HomeProvider._();

  static HomeProvider get instance => _instance ??= HomeProvider._();

  void logout() async {
    try {
      showLoading();
      clearStories();
      await _storageService.clearUser();
      globalContext?.goNamed(RouteName.loginScreen.name);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong $e');
    } finally {
      dismissLoading();
    }
  }

  void getStories() async {
    try {
      showLoading();
      clearStories();
      ReqStories reqStories =
          const ReqStories(location: true, size: 30, page: 1);
      List<Story> storyList =
          await _homeRepository.getStories(reqStories: reqStories);
      stories.addAll(storyList);
      notifyListeners();
    } on String catch (e) {
      _myRouter.showSnackbar(e);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong $e');
    } finally {
      dismissLoading();
    }
  }

  void gotoDetailStory(String storyId) {
    globalContext?.pushNamed(RouteName.detailStoryScreen.name, extra: storyId);
  }

  void gotoAddStory() {
    globalContext?.pushNamed(
      RouteName.addStoryScreen.name,
    );
  }

  void clearStories() {
    stories.clear();
    notifyListeners();
  }
}
