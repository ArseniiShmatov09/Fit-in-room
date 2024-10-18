abstract class SettingsRepository {
  Future<void> setDarkThemeSelected(bool selected);

  bool isDarkThemeSelected();

  double getFontScaleFactor();

  Future<void> setFontScaleFactor(double fontScaleFactor);
}
