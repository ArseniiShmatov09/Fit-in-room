import 'package:flutter/material.dart';
import '../../core_ui.dart';

class AppStyles {
  static TextStyle titleTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 48,
    fontWeight: FontWeight.w900,
  );

  static TextStyle subtitleTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );

  static TextStyle mainHeaderTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static TextStyle headerTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static TextStyle detailsTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );

  static TextStyle buttonTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static ButtonStyle roundButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadius20),
      side: const BorderSide(
        width: 3.0,
      ),
    ),
  );

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    shape: const RoundedRectangleBorder(),
  );

  static BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.borderRadius20),
  );

}