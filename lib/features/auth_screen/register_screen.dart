import 'package:flutter/material.dart';
import '../../common/common.dart';
import 'auth_screen.dart';

class RegisterScreen extends StatelessWidget with AuthTextFieldMixin {
  RegisterScreen({super.key});

  final AuthProvider authProvider = AuthProvider();

  void onPressRegister() async {
    authProvider.register(
      nameController.text,
      emailController.text,
      passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthTextField(
              controller: nameController,
              hintText: 'Name',
            ),
            const SizedBox(
              height: 14,
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
              onPress: onPressRegister,
              text: 'Daftar',
            )
          ],
        ),
      ),
    );
  }
}
