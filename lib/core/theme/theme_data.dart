import 'package:flutter/material.dart';
import 'package:webscraping/core/theme/theme_service.dart';

class CustomThemeDataModal extends ChangeNotifier {
  ThemeData? get getThemeData => ThemeService.instance.theme;

  void setThemeData() {
    ThemeService.instance.switchTheme();
    notifyListeners();
  }
}
