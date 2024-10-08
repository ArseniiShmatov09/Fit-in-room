import 'package:flutter/material.dart';
import '../../core_ui.dart';

class AppStyles {
  static TextStyle blackTitleTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 48,
    fontWeight: FontWeight.w900,
  );

  static TextStyle blackSubtitleTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 40,
    fontWeight: FontWeight.w900,
  );

  static TextStyle blackHeaderTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static TextStyle blackDetailsTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 20,
    fontWeight: FontWeight.w900,
  );

  static TextStyle whiteButtonTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );

  static ButtonStyle whiteRoundButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimens.borderRadius20),
      side: const BorderSide(
        width: 3.0,
      ),
    ),
  );

  static ButtonStyle blackButtonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    shape: const RoundedRectangleBorder(),
  );

  static BoxDecoration grayBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(AppDimens.borderRadius20),
  );

}