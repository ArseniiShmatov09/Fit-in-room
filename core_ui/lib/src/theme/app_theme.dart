import 'package:flutter/material.dart';

import '../../core_ui.dart';

const LightColors _appColors = LightColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: _appColors.white,
  textTheme: _getLightTextTheme(),
  inputDecorationTheme: _getInputDecorationTheme(),
  primaryColor: _appColors.white,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _appColors.white,
    primary: _appColors.white,
  ),
);

final ThemeData darkTheme = ThemeData.dark();

TextTheme _getLightTextTheme() {
  return TextTheme(
    titleMedium: AppFonts.normal13,
    bodyMedium: AppFonts.normal13,
  ).apply(
    bodyColor: _appColors.white,
    displayColor: _appColors.white,
  );
}

InputDecorationTheme _getInputDecorationTheme() {
  return InputDecorationTheme(
    hintStyle: AppFonts.normal13.copyWith(color: _appColors.white),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.borderRadius12),
      ),
      borderSide: BorderSide(
        color: _appColors.white,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.borderRadius12),
      ),
      borderSide: BorderSide(
        color: _appColors.white,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.borderRadius6),
      ),
      borderSide: BorderSide(
        color: _appColors.white,
        width: 2,
      ),
    ),
    labelStyle: AppFonts.normal13.copyWith(color: _appColors.white),
  );
}
