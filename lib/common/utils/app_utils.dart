import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ContextExt on BuildContext {
  double get getHeight => MediaQuery.of(this).size.height;
  double get getWidth => MediaQuery.of(this).size.width;
}

class AppUtils {
  static TextStyle get _baseTextStyle => GoogleFonts.ptSans();

  static TextStyle regularTextStyle(
          {double? fontSize, FontStyle? fontStyle, Color? fontColor}) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontStyle: fontStyle,
        color: fontColor,
      );

  static TextStyle mediumTextStyle(
          {double? fontSize, FontStyle? fontStyle, Color? fontColor}) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontStyle: fontStyle,
        color: fontColor,
      );

  static TextStyle semiBoldTextStyle(
          {double? fontSize, FontStyle? fontStyle, Color? fontColor}) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        fontStyle: fontStyle,
        color: fontColor,
      );

  static TextStyle thinTextStyle(
          {double? fontSize, FontStyle? fontStyle, Color? fontColor}) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w100,
        color: fontColor,
        fontStyle: fontStyle,
      );

  static EdgeInsets get baseMarginPadding8 => const EdgeInsets.all(8);
  static EdgeInsets get baseMarginPadding12 => const EdgeInsets.all(12);
  static EdgeInsets get baseMarginPadding14 => const EdgeInsets.all(14);
  static EdgeInsets get baseMarginPadding16 => const EdgeInsets.all(16);
}
