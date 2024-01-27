import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../common/common.dart';
import 'auth_screen.dart';

class LoginScreen extends StatelessWidget with AuthTextFieldMixin {
  LoginScreen({super.key});

  final AuthProvider authProvider = AuthProvider();

  void onPressRegister() {
    globalContext?.pushNamed(RouteName.registerScreen.name);
  }

  void onPressLogin() async {
    authProvider.login(emailController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DefaultText(
                'Story App',
                fontSize: 48,
                color: AppColors.blackColor,
              ),
              const SizedBox(
                height: 48,
              ),
              AuthTextField(
                controller: emailController,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 14,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: valSecurePassword,
                builder: (context, obsecureText, child) => AuthTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecureText: obsecureText,
                  onPressObsecureText: () =>
                      valSecurePassword.value = !obsecureText,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              DefaultButton(
                onPress: onPressLogin,
                child: const Text(
                  'Masuk',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum punya akun? ',
                  ),
                  GestureDetector(
                    onTap: onPressRegister,
                    child: const Text(
                      'daftar',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
