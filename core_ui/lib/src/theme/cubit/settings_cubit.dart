import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required SettingsRepository themeRepository,
  })  : _themeRepository = themeRepository,
        super(
        const SettingsState(
          brightness: Brightness.light,
          fontScaleFactor: 1.0,
        ),
      ) {
    _checkSelectedTheme();
    _loadFontScaleFactor();
  }

  final SettingsRepository _themeRepository;

  Future<void> setThemeBrightness(Brightness brightness) async {
    emit(state.copyWith(brightness: brightness));
    await _themeRepository.setDarkThemeSelected(brightness == Brightness.dark);
  }

  Future<void> setFontScaleFactor(double fontScaleFactor) async {
    emit(state.copyWith(fontScaleFactor: fontScaleFactor));
    await _themeRepository.setFontScaleFactor(fontScaleFactor);
  }

  void _checkSelectedTheme() {
    final Brightness brightness = _themeRepository.isDarkThemeSelected()
        ? Brightness.dark
        : Brightness.light;
    emit(state.copyWith(brightness: brightness));
  }

  void _loadFontScaleFactor() {
    final double fontScaleFactor = _themeRepository.getFontScaleFactor();
    emit(state.copyWith(fontScaleFactor: fontScaleFactor));
  }
}

