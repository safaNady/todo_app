import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeAppTheme(ThemeMode newTheme) {
    if (newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeLanguage(BuildContext context, String languageCode) {
    // Convert languageCode to Locale
    Locale newLocale = Locale(languageCode);
    EasyLocalization.of(context)?.setLocale(newLocale);
    notifyListeners();
  }
}
