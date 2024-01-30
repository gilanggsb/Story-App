import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import '../../../common/common.dart';
import '../data/data.dart';

abstract class Disposable {
  void dispose();
}

enum HomeState {
  initial,
  loading,
  loaded,
}

class HomeProvider extends ChangeNotifier {
  final StorageService _storageService = StorageService.instance;
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;
  final HomeRepository _homeRepository = HomeRepository();
  int? pageItems = 1;
  int sizeItems = 10;
  List<Story> stories = [];
  HomeState homeState = HomeState.initial;
  final ScrollController scrollController = ScrollController();

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
      if (pageItems == 1) {
        homeState = HomeState.loading;
        notifyListeners();
      }
      // clearStories();
      ReqStories reqStories = ReqStories(
        location: 0,
        size: sizeItems,
        page: pageItems,
      );

      List<Story> storyList =
          await _homeRepository.getStories(reqStories: reqStories);
      stories.addAll(storyList);
      homeState = HomeState.loaded;

      if (storyList.length < sizeItems) {
        pageItems = null;
      } else {
        pageItems = pageItems! + 1;
      }

      notifyListeners();
    } on String catch (e) {
      _myRouter.showSnackbar(e);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong $e');
    } finally {}
  }

  void gotoDetailStory(String storyId) {
    globalContext?.pushNamed(RouteName.detailStoryScreen.name, extra: storyId);
  }

  void gotoAddStory() async {
    try {
      await Geolocator.requestPermission();
      final bool? isRefresh = await globalContext?.pushNamed<bool?>(
        RouteName.addStoryScreen.name,
      );
      if (isRefresh == null) return;
      if (!isRefresh) return;

      clearStories();
    } catch (e) {}
  }

  void clearStories() {
    homeState = HomeState.initial;
    pageItems = 1;
    stories.clear();
    notifyListeners();
  }
}
