import 'package:flutter/material.dart';
import 'package:story_app/common/common.dart';
import '../../features/features.dart';

class MyRouterDelegate extends RouterDelegate<RouteParamsModel>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteParamsModel> {
  MyRouterDelegate._() : _navigatorKey = GlobalKey<NavigatorState>();

  static final instance = MyRouterDelegate._();

  final GlobalKey<NavigatorState> _navigatorKey;
  BuildContext? context;
  RouteParamsModel? routeParamsModel;
  List<Page> historyStack = [];

  RouteParamsModel? get() => routeParamsModel;

  @override
  Widget build(BuildContext context) {
    if (routeParamsModel?.routeName == null) {
      historyStack = _splashStack;
    } else if (routeParamsModel?.isLoggedIn ?? false) {
      historyStack = _loginStack;
    } else {
      historyStack = _logoutStack;
    }
    return Navigator(
      key: navigatorKey,
      pages: historyStack,
      onPopPage: ((route, result) {
        final bool didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }
        routeParamsModel = routeParamsModel?.copyWith(
          params: null,
          routeName: routeParamsModel?.lastRouteName,
          lastRouteName: routeParamsModel?.routeName,
        );
        notifyListeners();
        return true;
      }),
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async {}

  List<Page> get _splashStack => [
        const MaterialPage(
          key: ValueKey("SplashScreen"),
          child: SplashScreen(),
        ),
      ];

  List<Page> get _logoutStack => [
        MaterialPage(
          key: const ValueKey("LoginScreen"),
          child: LoginScreen(),
        ),
        if (routeParamsModel?.routeName == RouteName.registerScreen)
          MaterialPage(
            key: const ValueKey("RegisterScreen"),
            child: RegisterScreen(),
          ),
      ];

  List<Page> get _loginStack => [
        const MaterialPage(
          key: ValueKey("LoginScreen"),
          child: HomeScreen(),
        ),
        if (routeParamsModel?.routeName == RouteName.addStoryScreen)
          MaterialPage(
            key: const ValueKey("AddStoryScreen"),
            child: AddStoryScreen(),
          ),
        if (routeParamsModel?.routeName == RouteName.detailStoryScreen)
          MaterialPage(
            key: const ValueKey("DetailStoryScreen"),
            child: DetailStoryScreen(),
          ),
      ];

  void changeRoute<T>({
    required RouteName routeName,
    RouteName? lastRouteName,
    bool? isLoggedIn,
    T? params,
  }) {
    context = _navigatorKey.currentContext;
    routeParamsModel = routeParamsModel == null
        ? RouteParamsModel(
            routeName: routeName,
            params: params,
            isLoggedIn: isLoggedIn,
            lastRouteName: lastRouteName ?? routeParamsModel?.routeName,
          )
        : routeParamsModel?.copyWith(
            routeName: routeName,
            lastRouteName: lastRouteName ?? routeParamsModel?.routeName,
            isLoggedIn: isLoggedIn,
            params: params,
          );
    debugPrint('Current Route Name ${routeParamsModel?.routeName}');
    notifyListeners();
  }

  void showSnackbar(String text, {Widget? child}) {
    ScaffoldMessenger.of(navigatorKey!.currentContext!).showSnackBar(
      SnackBar(
        content: child ??
            DefaultText(
              text,
              color: AppColors.whiteColor,
            ),
      ),
    );
  }
}
