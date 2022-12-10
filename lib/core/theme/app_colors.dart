import 'package:flutter/material.dart';

import 'ui_parameters.dart';

const Color onSurfaceTextColor = Colors.white;
const Color correctAnswerColor = Color(0xFF3ac3cb);
const Color primaryColorDark = Color(0xFF2a3c65);
const Color primaryColorLight = Color(0xFF99ace1);

//const Color darkScaffoldTopColor = Color(0xFF0b3e75);
const Color darkScaffoldTopColor = Color(0xFF7A0901);
//const Color darkScaffolBackgroundColor=Color(0xFF020c17);
const Color darkScaffolBackgroundColor = Color(0xFF1E1E1E);

//const Color lightScaffoldTopColor = Color(0xFF859eba);
const Color lightScaffoldTopColor = Color(0xFF9B1E48);
//const Color lightScaffolBackgroundColor=Color(0xFFced8e3);
const Color lightScaffolBackgroundColor = Color(0xFFF8F8F8);

Color customScaffoldColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? darkScaffoldTopColor
        : lightScaffoldTopColor;
Color customMenuBackgroundColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? darkScaffolBackgroundColor
        : lightScaffolBackgroundColor;
Color customTileColor(BuildContext context) => UIParameters.isDarkMode(context)
    ? const Color(0xFF323232)
    : const Color(0xFFCBD9E1);
Color menuTextColor(BuildContext context) =>
    UIParameters.isDarkMode(context) ? Colors.white : const Color(0xFF0b3e75);
Color customBorderColor(BuildContext context) =>
    UIParameters.isDarkMode(context)
        ? Colors.white
        : const Color(0xFF323232).withOpacity(0.5);
