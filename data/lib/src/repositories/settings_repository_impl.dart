import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  static const String _isDarkThemeSelected = 'dark_theme_selected';
  static const String _fontScaleKey = 'font_scale_factor';
  final SharedPreferences preferences;

  SettingsRepositoryImpl({required this.preferences});

  @override
  bool isDarkThemeSelected() {
    final bool? selected = preferences.getBool(_isDarkThemeSelected);
    return selected ?? false;
  }

  @override
  Future<void> setDarkThemeSelected(bool selected) async {
    await preferences.setBool(_isDarkThemeSelected, selected);
  }

  @override
  double getFontScaleFactor() {
    final double? fontScaleFactor = preferences.getDouble(_fontScaleKey);
    return fontScaleFactor ?? 1.0;
  }

  @override
  Future<void> setFontScaleFactor(double fontScaleFactor) async {
    await preferences.setDouble(_fontScaleKey, fontScaleFactor);
  }
}
