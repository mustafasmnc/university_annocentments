// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/core/view_model/widgets/widgets.dart';

import '../core/theme/app_colors.dart';
import '../core/view_model/widgets/top_background.dart';

class UniEvi extends StatefulWidget {
  const UniEvi({Key? key}) : super(key: key);

  @override
  _UniEviState createState() => _UniEviState();
}

class _UniEviState extends State<UniEvi> {
  late Future getMealList;
  bool connectedInternet = false;
  @override
  void initState() {
    super.initState();
    getMealList = ScrapeData().getMeals();
    checkInternetConn();
  }

  enjoyMeal() {
    Color backgroundColor = customTileColor(context);
    Future<Null>.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(
        new SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "AFİYET OLSUN 😊",
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 5,
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          duration: Duration(seconds: 3),
          backgroundColor: backgroundColor,
        ),
      );
    });
  }

  checkInternetConn() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          connectedInternet = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        connectedInternet = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: connectedInternet
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    TopBackground(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10)
                            .copyWith(top: 20),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.arrow_back_ios_new,
                                      color: Colors.white)),
                            ),
                            const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Üniversite Evi',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        child: FutureBuilder(
                      future: getMealList,
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 90,
                              child: Center(child: circularLoader(context)));
                        }
                        if (snapshot.hasError) {
                          print("ERROR: ${snapshot.error}");
                          String errorTitle = snapshot.error.toString();

                          if (errorTitle
                              .contains('Valid value range is empty: 0')) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height - 90,
                              child: Center(
                                  child: errorMsg(
                                      errorTitle:
                                          'Üniversite Evinde Öğün Bulunamadı')),
                            );
                          } else {
                            return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height - 90,
                                child: Center(child: errorMsg()));
                          }
                        }
                        if (snapshot.hasData) {
                          enjoyMeal();
                          return Column(
                            children: [
                              SizedBox(height: 10),
                              MenuDate(
                                  menuItem: mealDate == null ? '' : mealDate),
                              ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: mealList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  //return MenuItems(menuItem: mealList[index]);
                                  //return Meals(menuItem: mealList[index]);
                                  return MenuDate(menuItem: mealList[index]);
                                },
                              ),
                              SizedBox(height: 50),
                              bakiyeSection(),
                              SizedBox(height: 20),
                            ],
                          );
                        } else {
                          return Center(child: circularLoader(context));
                        }
                      },
                    )),
                  ],
                ),
              )
            : noInternetConn());
  }

  bakiyeSection() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 110,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ThemeService.instance.isDarkMode()
                ? Color(0xFF292D32).withOpacity(.1)
                : Color(0xFF292D32).withOpacity(.1),
            boxShadow: [
              BoxShadow(
                  color: ThemeService.instance.isDarkMode()
                      ? Colors.white.withOpacity(0.1)
                      : Colors.white.withOpacity(0.8),
                  offset: Offset(-6.0, -6.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
              BoxShadow(
                  color: ThemeService.instance.isDarkMode()
                      ? Colors.black.withOpacity(0.4)
                      : Colors.black.withOpacity(0.1),
                  offset: Offset(6.0, 6.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0),
            ]),
        child: InkWell(
          onTap: () => launchURL(
              'https://jasig.firat.edu.tr/cas/login?service=https://ybs.firat.edu.tr/User/Login'),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/img/creditcard.png",
                height: 100,
                fit: BoxFit.fitHeight,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Yemekhane İçin Bakiye Yükle",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "Tarayıcıda Açmak için Tıklayınız",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuDate extends StatelessWidget {
  final String? menuItem;
  const MenuDate({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ThemeService.instance.isDarkMode()
                  ? Color(0xFF292D32).withOpacity(.1)
                  : Color(0xFF292D32).withOpacity(.1),
              boxShadow: [
                BoxShadow(
                    color: ThemeService.instance.isDarkMode()
                        ? Colors.white.withOpacity(0.1)
                        : Colors.white.withOpacity(0.8),
                    offset: Offset(-6.0, -6.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: ThemeService.instance.isDarkMode()
                        ? Colors.black.withOpacity(0.4)
                        : Colors.black.withOpacity(0.1),
                    offset: Offset(6.0, 6.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ]),
          child: Text(menuItem!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: ThemeService.instance.isDarkMode()
                      ? Colors.white
                      : Colors.black87)),
        ),
      ),
    );
  }
}
