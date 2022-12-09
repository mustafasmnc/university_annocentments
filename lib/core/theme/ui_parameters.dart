import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme_data.dart';

const double _mobileScreenPadding = 25.0;
const double _cardBorderRadius = 10.0;

double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);
  static bool isDarkMode(BuildContext context) {
    return Provider.of<CustomThemeDataModal>(context).isDarkMode!;
  }
}
