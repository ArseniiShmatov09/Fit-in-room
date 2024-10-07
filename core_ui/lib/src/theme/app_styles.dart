import 'package:flutter/material.dart';
import '../../gen/fonts.gen.dart';

class AppStyles {
  static TextStyle blackTitleTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 48,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );

  static TextStyle blackSubtitleTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 40,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );

  static TextStyle blackHeaderTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );

  static TextStyle blackDetailsTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );

  static TextStyle whiteButtonTextStyle = const TextStyle(
    fontFamily: FontFamily.sofiaSans,
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  static ButtonStyle whiteRoundButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: const BorderSide(
        width: 3.0,
      ),
    ),
  );

  static ButtonStyle blackButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black,
    minimumSize: const Size(double.infinity, 50),
    shape: const RoundedRectangleBorder(),
  );

  static BoxDecoration grayBoxDecoration = BoxDecoration(
    color: const Color.fromRGBO(217, 217, 217, 1),
    borderRadius: BorderRadius.circular(20.0),
  );

}