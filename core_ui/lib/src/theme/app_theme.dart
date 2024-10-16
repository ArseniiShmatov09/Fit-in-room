import 'package:flutter/material.dart';

import '../../core_ui.dart';

const LightColors _appColors = LightColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  // appBarTheme: _getAppBarTheme(),
  scaffoldBackgroundColor: _appColors.white,
  textTheme: _getLightTextTheme(),
  inputDecorationTheme: _getInputDecorationTheme(),
  primaryColor: _appColors.primaryBg,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _appColors.primaryBg,
    primary: _appColors.primaryBg,
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  // appBarTheme: _getAppBarTheme(),
  scaffoldBackgroundColor: _appColors.black,
  textTheme: _getDarkTextTheme(),
  inputDecorationTheme: _getInputDecorationTheme(),
  primaryColor: _appColors.black,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: _appColors.black,
    primary: _appColors.black,
  ),
);

TextTheme _getLightTextTheme() {
  return TextTheme(
    titleMedium: AppFonts.normal13,
    bodyMedium: AppFonts.normal13,
  ).apply(
    bodyColor: _appColors.primaryBg,
    displayColor: _appColors.primaryBg,
  );
}

TextTheme _getDarkTextTheme() {
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
    hintStyle: AppFonts.normal13.copyWith(color: _appColors.primaryBg),
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.borderRadius12),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.borderRadius12),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimens.borderRadius6),
      ),
      borderSide: BorderSide(
        color: _appColors.primaryBg,
        width: 2,
      ),
    ),
    labelStyle: AppFonts.normal13.copyWith(color: _appColors.primaryBg),
  );
}
