import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../core/model/rate_app_init_widget.dart';
import '../core/theme/app_colors.dart';
import 'main_page.dart';
import 'menu_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        style: DrawerStyle.defaultStyle,
        //openCurve: Curves.slowMiddle,
        //duration: const Duration(milliseconds: 1500),
        menuBackgroundColor: customMenuBackgroundColor(context),
        mainScreen: RateAppInitWidget(
          builder: (rateMyApp) => MainPage(
            rateMyApp: rateMyApp,
          ),
        ),
        menuScreen: const MenuPage(),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        drawerShadowsBackgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width * 0.80,
      );
}
