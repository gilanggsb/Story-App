import 'package:flutter/material.dart';

import '../common.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.onPress,
    this.text,
    this.padding,
    this.width,
    this.margin,
    this.textAlign,
    this.backgroundColor,
    this.borderRadius,
    this.borderColor,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.child,
    this.boxShadow,
  }) : super(key: key);
  final Function() onPress;
  final String? text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final TextAlign? textAlign;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? borderColor;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final Widget? child;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: margin,
        width: width,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.blackColor,
          border: Border.all(color: borderColor ?? AppColors.transparentColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          boxShadow: boxShadow,
        ),
        child: child ??
            DefaultText(
              text ?? "",
              mainAxisAlignmentRow: MainAxisAlignment.center,
              textAlign: textAlign,
              fontSize: fontSize ?? 16,
              fontWeight: fontWeight ?? FontWeight.w700,
              color: fontColor ?? AppColors.whiteColor,
            ),
      ),
    );
  }
}
