import 'package:flutter/material.dart';
import '../auth_screen/data/data.dart';
import '../../common/common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    final MyRouterDelegate myRouter = MyRouterDelegate.instance;
    final StorageService storageService = StorageService.instance;
    final UserModel? user = await storageService.getUser();
    if (user == null) {
      myRouter.changeRoute(routeName: RouteName.loginScreen);
      return;
    }

    myRouter.changeRoute(routeName: RouteName.homeScreen, isLoggedIn: true);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Center(
        child: Text(
          'Story App',
          style: AppUtils.mediumTextStyle(
            fontSize: 36,
            fontColor: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
