import 'package:story_app/common/routes/route_name.dart';

class RouteParamsModel<T> {
  final RouteName routeName;
  final RouteName? lastRouteName;
  final bool? isLoggedIn;
  final T? params;

  const RouteParamsModel({
    required this.routeName,
    this.isLoggedIn = false,
    this.lastRouteName,
    this.params,
  });

  RouteParamsModel copyWith({
    RouteName? routeName,
    RouteName? lastRouteName,
    bool? isLoggedIn,
    T? params,
  }) {
    return RouteParamsModel(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      lastRouteName: lastRouteName ?? this.lastRouteName,
      params: params ?? this.params,
      routeName: routeName ?? this.routeName,
    );
  }
}
