import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rate_my_app/rate_my_app.dart';

import '../core/data/scrape_data.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/ui_parameters.dart';
import '../core/view_model/custom_slide_route.dart';
import '../core/view_model/widgets/custom_button.dart';
import 'drawer_page.dart';

class SplashPage extends StatefulWidget {
  RateMyApp? rateMyApp;
  SplashPage({Key? key, this.rateMyApp}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    checkInternetConn();
  }

  checkInternetConn() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        getData();
      }
    } on SocketException catch (_) {
      showAlert();
    }
  }

  getData() async {
    await ScrapeData().getFuNewsEventAnno(restLink: fuNewsLink, page: 1);
    await ScrapeData().getFuNewsEventAnno(restLink: fuAnnoLink, page: 1);
    ScrapeData().getFuNewsEventAnno(restLink: fuEventLink, page: 1).then(
        (value) => Navigator.pushAndRemoveUntil(
            context,
            CustomSlideRoute(page: const DrawerPage()),
            (Route<dynamic> route) => false));
  }

  showAlert() {
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              backgroundColor: customTileColor(context),
              content: SizedBox(
                height: 220,
                child: Column(
                  children: const [
                    Image(image: AssetImage('assets/img/no_internet.png')),
                    Text(
                      'İnternet Bağlantınızı Kontrol Ediniz!',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      title: 'Kapat',
                      width: 75.00,
                      padding: 10,
                      color: UIParameters.isDarkMode(context)
                          ? correctAnswerColor
                          : primaryColorDark,
                      onTap: () {
                        // Navigator.pop(context);
                        // checkInternetConn();
                        SystemNavigator.pop();
                      },
                    ),
                    CustomButton(
                      title: 'Devam',
                      width: 200.00,
                      padding: 10,
                      color: UIParameters.isDarkMode(context)
                          ? correctAnswerColor
                          : primaryColorDark,
                      onTap: () {
                        Navigator.pop(context);
                        checkInternetConn();
                      },
                    ),
                  ],
                )
              ],
            ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: customMenuBackgroundColor(context)),
      child: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image(
            width: MediaQuery.of(context).size.width * 0.35,
            fit: BoxFit.fitWidth,
            image: UIParameters.isDarkMode(context)
                ?const  AssetImage(
                    'assets/img/uni_logo_white.png',
                  )
                :const  AssetImage(
                    'assets/img/uni_logo_black.png',
                  ),
          ),
        ),
      ),
    ));
  }
}
