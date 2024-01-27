import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../common/common.dart';
import '../data/data.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  final MyRouterDelegate _myRouter = MyRouterDelegate.instance;

  void login(String email, String password) async {
    try {
      showLoading();
      final ReqLoginModel reqLoginModel =
          ReqLoginModel(email: email, password: password);
      final UserModel? res = await _authRepository.login(reqLoginModel);
      if (res == null) {
        return;
      }
      _myRouter.showSnackbar("Login successfully");
      // _myRouter.isLogin = true;
      globalContext?.goNamed(RouteName.homeScreen.name);
    } on String catch (e) {
      _myRouter.showSnackbar(e);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong with $e');
    } finally {
      dismissLoading();
    }
  }

  void register(String name, String email, String password) async {
    try {
      showLoading();
      final ReqRegisterModel reqRegisterModel =
          ReqRegisterModel(email: email, name: name, password: password);
      final bool res = await _authRepository.register(reqRegisterModel);
      if (!res) {
        return;
      }
      _myRouter.showSnackbar("Register successfully");
      _myRouter.popRoute();
    } on String catch (e) {
      _myRouter.showSnackbar(e);
    } catch (e) {
      _myRouter.showSnackbar('Something went wrong with $e');
    } finally {
      dismissLoading();
    }
  }
}
