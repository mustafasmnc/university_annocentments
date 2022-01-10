// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/core/view_model/widgets.dart';

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
    return Scaffold(
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
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: circularLoader());
                  if (snapshot.hasError)
                    return Center(child: Text("ERROR: ${snapshot.error}"));
                  if (snapshot.hasData) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            MenuItems(
                                menuItem: mealDate == null ? '' : mealDate),
                            ListView.builder(
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: mealList.length,
                              itemBuilder: (BuildContext context, int index) {
                                //return MenuItems(menuItem: mealList[index]);
                                return Deneme(menuItem: mealList[index]);
                              },
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
            : noInternetConn());
  }
}

class Deneme extends StatelessWidget {
  String menuItem;
  Deneme({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 125,
        width: MediaQuery.of(context).size.width / 2,
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(menuItem,
                    style: TextStyle(
                        fontSize: 18,
                        color: ThemeService.instance.isDarkMode()
                            ? Colors.white
                            : Colors.black87)),
              ),
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

class MenuItems extends StatelessWidget {
  String menuItem;
  MenuItems({required this.menuItem});

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
