import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState>{
  ThemeCubit({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository,
        super (const ThemeState(Brightness.light)){
    _checkSelectedTheme();
  }

  final ThemeRepository _themeRepository;

  Future<void> setThemeBrightness(Brightness brightness) async {
    emit(ThemeState(brightness));
    await _themeRepository.setDarkThemeSelected(brightness == Brightness.dark);
  }

  void _checkSelectedTheme(){
    final Brightness brightness = _themeRepository.isDarkThemeSelected()
        ? Brightness.dark
        : Brightness.light;
    emit(ThemeState(brightness));
  }
}