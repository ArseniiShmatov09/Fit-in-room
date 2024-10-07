import 'package:flutter/material.dart';

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }

  Color get primaryBg;

  Color get white;

  Color get black;

  Color get gray;
}

class DarkColors extends LightColors {
  const DarkColors();

}

class LightColors implements AppColors {
  const LightColors();

  @override
  Color get primaryBg => const Color(0xFFeceff1);

  @override
  Color get white => const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color get black => const Color.fromRGBO(0, 0, 0, 1);

  @override
  Color get gray => const Color.fromRGBO(217, 217, 217, 1);

}
