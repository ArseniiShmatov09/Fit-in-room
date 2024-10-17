import 'package:domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  static const String _isDarkThemeSelected = 'dark_theme_selected';
  final SharedPreferences preferences;

  ThemeRepositoryImpl({required this.preferences});

  @override
  bool isDarkThemeSelected() {
    final bool? selected = preferences.getBool(_isDarkThemeSelected);
    return selected ?? false;
  }

  @override
  Future<void> setDarkThemeSelected(bool selected) async {
    await preferences.setBool(_isDarkThemeSelected, selected);
  }
}
