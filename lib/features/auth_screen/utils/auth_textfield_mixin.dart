import 'package:flutter/material.dart';

mixin AuthTextFieldMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> valSecurePassword = ValueNotifier<bool>(true);
}
