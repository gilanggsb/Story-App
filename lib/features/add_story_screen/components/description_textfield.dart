import 'package:flutter/material.dart';
import '../../../common/common.dart';

class DescriptionTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obsecureText;
  final VoidCallback? onPressObsecureText;
  const DescriptionTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obsecureText = false,
    this.onPressObsecureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      obscureText: obsecureText,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        contentPadding: AppUtils.baseMarginPadding16,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blackColor),
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: onPressObsecureText != null
            ? IconButton(
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: AppColors.blackColor,
                ),
                onPressed: onPressObsecureText,
              )
            : null,
      ),
    );
  }
}
