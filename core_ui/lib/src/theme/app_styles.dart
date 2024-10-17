import 'package:flutter/material.dart';
import '../../core_ui.dart';
import 'app_colors.dart';

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
      side: BorderSide(
        width: 3.0,
       //todo button color
        // color: AppColors.of(context).black,
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