import 'package:flutter/material.dart';
import '../../core_ui.dart';

class AppStyles {
  static const TextStyle titleTextStyle = TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 48,
    fontWeight: FontWeight.w900,
  );

   static const TextStyle subtitleTextStyle = TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle mainHeaderTextStyle = TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle headerTextStyle = TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle detailsTextStyle = TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle buttonTextStyle = TextStyle(
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