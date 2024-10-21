import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../../core_ui.dart';
import '../../gen/fonts.gen.dart';

class AppStyles {
  final double fontScaleFactor;

  AppStyles(this.fontScaleFactor);

  static AppStyles of(BuildContext context) {
    final double fontScaleFactor = context.watch<SettingsCubit>().state.fontScaleFactor;
    return AppStyles(fontScaleFactor);
  }

  TextStyle get titleTextStyle => TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 40 * fontScaleFactor,
    fontWeight: FontWeight.w900,
  );

  TextStyle get subtitleTextStyle => TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 30 * fontScaleFactor,
    fontWeight: FontWeight.w700,
  );

  TextStyle get mainHeaderTextStyle => TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 28 * fontScaleFactor,
    fontWeight: FontWeight.w900,
  );

  TextStyle get headerTextStyle => TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 20 * fontScaleFactor,
    fontWeight: FontWeight.w900,
  );

  TextStyle get detailsTextStyle => TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 16 * fontScaleFactor,
    fontWeight: FontWeight.w700,
  );

  TextStyle get buttonTextStyle => TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 18 * fontScaleFactor,
    fontWeight: FontWeight.w700,
  );

  static ButtonStyle roundButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
  );

  static const BorderSide appBorderSide = BorderSide(
    width: 3.0,
  );

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    shape: const RoundedRectangleBorder(),
  );

  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.borderRadius20),
  );
}
