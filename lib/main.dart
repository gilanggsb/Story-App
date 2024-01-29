import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'common/common.dart';
import 'features/home_screen/controllers/controllers.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyRouterDelegate myRouterDelegate = MyRouterDelegate.instance;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => myRouterDelegate),
        ChangeNotifierProvider(create: (context) => HomeProvider.instance),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Story App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoadingOverlayAlt(
          child: MaterialApp.router(
            routerConfig: myRouterDelegate.routerConfig,
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
