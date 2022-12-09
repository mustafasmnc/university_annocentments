import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_colors.dart';

class ThemeService {
  SharedPreferences? _preferences;
  static ThemeService instance = ThemeService._privateConstructor();

  ThemeService._privateConstructor();

  static Future<void> init() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  ThemeData darkTheme = ThemeData.dark()
      .copyWith(scaffoldBackgroundColor: darkScaffolBackgroundColor);
  ThemeData lightTheme = ThemeData.light()
      .copyWith(scaffoldBackgroundColor: lightScaffolBackgroundColor);

  bool isDarkMode() => _preferences!.getBool("isDarkMode") ?? false;

  ThemeData get theme => isDarkMode()
      ? ThemeData.dark().copyWith(
          scaffoldBackgroundColor: darkScaffolBackgroundColor,
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: darkScaffoldTopColor),
        )
      : ThemeData.light().copyWith(
          scaffoldBackgroundColor: lightScaffolBackgroundColor,
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: lightScaffoldTopColor),
        );

  //ThemeData get theme => isDarkMode() ? ThemeData.dark() : ThemeData.light();
  //ThemeData get theme => isDarkMode() ? ThemeData.dark() : ThemeData.light();

  void switchTheme() {
    _preferences!.setBool("isDarkMode", !isDarkMode());
    print(theme);
  }
}
