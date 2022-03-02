// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/core/view_model/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
          backgroundColor: Colors.grey[600],
        ),
      );
    });
    getMealList = ScrapeData().getMeals();
    checkInternetConn();
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
    return SafeArea(
      child: Scaffold(
          backgroundColor: ThemeService.instance.isDarkMode()
              ? Color(0xFF292D32)
              : Colors.grey[300],
          appBar: AppBar(
            // title: Text("Üniversite Evi",
            //     style: TextStyle(
            //         fontSize: 20,
            //         color: ThemeService.instance.isDarkMode()
            //             ? Colors.white
            //             : Colors.black54)),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(
              color: ThemeService.instance.isDarkMode()
                  ? Colors.white
                  : Colors.black87, //change your color here
            ),
          ),
          body: connectedInternet
              ? Container(
                  child: FutureBuilder(
                  future: getMealList,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: circularLoader());
                    }
                    if (snapshot.hasError) {
                      print("ERROR: ${snapshot.error}");
                      String errorTitle = snapshot.error.toString();
    
                      if (errorTitle.contains('Valid value range is empty: 0')) {
                        return Center(
                            child: errorMsg(
                                errorTitle: 'Üniversite Evinde Öğün Bulunamadı'));
                      } else {
                        return Center(child: errorMsg());
                      }
                    }
                    if (snapshot.hasData) {
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              //SizedBox(height: 10),
                              MenuDate(
                                  menuItem: mealDate == null ? '' : mealDate),
                              ListView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: mealList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  //return MenuItems(menuItem: mealList[index]);
                                  return Meals(menuItem: mealList[index]);
                                },
                              ),
                              SizedBox(height: 20),
                              Container(
                                height: 110,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: ThemeService.instance.isDarkMode()
                                        ? Color(0xFF292D32).withOpacity(.9)
                                        : Color(0xFF292D32).withOpacity(.1),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              ThemeService.instance.isDarkMode()
                                                  ? Colors.white.withOpacity(0.1)
                                                  : Colors.white.withOpacity(0.8),
                                          offset: Offset(-6.0, -6.0),
                                          blurRadius: 15.0,
                                          spreadRadius: 1.0),
                                      BoxShadow(
                                          color:
                                              ThemeService.instance.isDarkMode()
                                                  ? Colors.black.withOpacity(0.4)
                                                  : Colors.black.withOpacity(0.1),
                                          offset: Offset(6.0, 6.0),
                                          blurRadius: 15.0,
                                          spreadRadius: 1.0),
                                    ]),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/img/creditcard.png",
                                      fit: BoxFit.fitHeight,
                                    ),
                                    GestureDetector(
                                      onTap: _launchURL,
                                      child: Wrap(children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
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
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(child: circularLoader());
                    }
                  },
                ))
              : noInternetConn()),
    );
  }

  _launchURL() async {
    const url =
        'https://jasig.firat.edu.tr/cas/login?service=https://ybs.firat.edu.tr/User/Login';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class Meals extends StatelessWidget {
  String menuItem;
  Meals({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 125,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
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
                ],
                image: DecorationImage(
                  image: AssetImage(ThemeService.instance.isDarkMode()
                      ? "assets/img/footer-bg.png"
                      : "assets/img/bg-pattern.png"),
                  fit: BoxFit.cover,
                ),
              ),
              margin: EdgeInsets.only(top: 1),
              height: 75,
              width: MediaQuery.of(context).size.width - 75,
              child: Text(menuItem,
                  style: TextStyle(
                      fontSize: 18,
                      color: ThemeService.instance.isDarkMode()
                          ? Colors.white
                          : Colors.black87)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(ThemeService.instance.isDarkMode()
                        ? "assets/img/firat-white.png"
                        : "assets/img/firat_logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MenuDate extends StatelessWidget {
  String menuItem;
  MenuDate({required this.menuItem});

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
          child: Text(menuItem,
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
