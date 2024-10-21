import 'package:flutter/material.dart';

abstract class AppColors {
  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? const LightColors()
        : const DarkColors();
  }

  Color get white;

  Color get black;

  Color get lightGray;

  Color get gray;

  Color get red;

  Color get green;

  Color get lightBlack;
}

class DarkColors extends LightColors {
  const DarkColors();

  @override
  Color get white => const Color(0xFF000000);

  @override
  Color get black => const Color(0xFFFFFFFF);

  @override
  Color get lightGray => const Color(0xFF808080);

  @override
  Color get gray => const Color(0xFFD9D9D9);

  @override
  Color get lightBlack => const Color(0xFFC5C5C5);
}

class LightColors implements AppColors {
  const LightColors();

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

  @override
  Color get lightBlack => const Color(0xFF383838);
}
