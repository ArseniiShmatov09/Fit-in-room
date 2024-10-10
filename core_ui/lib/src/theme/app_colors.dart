import 'package:flutter/material.dart';

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? const LightColors()
        : const DarkColors();
  }

  Color get primaryBg;

  Color get white;

  Color get black;

  Color get lightGray;

  Color get gray;

  Color get red;

  Color get green;
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors implements AppColors {
  const LightColors();

  @override
  Color get primaryBg => const Color(0xFFeceff1);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get black => const Color(0xFF000000);

  @override
  Color get lightGray => const Color(0xFFD9D9D9);

  @override
  Color get gray => const Color(0xFF808080);

  @override
  Color get red => const Color(0xFFFF0000);

  @override
  Color get green => const Color(0xFF00FF2A);
}
