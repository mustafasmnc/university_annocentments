import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/model/department_model.dart';
import 'package:webscraping/core/model/google_maps.dart';
import 'package:webscraping/core/theme/theme_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/core/view_model/widgets.dart';
import 'package:webscraping/pages/department_page.dart';
import 'package:webscraping/pages/endtermaverage_page.dart';
import 'package:webscraping/pages/fu_news_event_anno.dart';
import 'package:webscraping/pages/uni_evi.dart';
import 'package:webscraping/pages/vizefinal_page.dart';
import 'package:webscraping/pages/web_views.dart';
import 'package:webscraping/pages/web_views_pdf.dart';
import 'package:webscraping/size_config.dart';

class MainPage extends StatefulWidget {
  RateMyApp? rateMyApp;
  MainPage({Key? key, this.rateMyApp}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected = 0;
  bool connectedInternet = false;

  late Future fuNews;
  late Future fuAnno;
  late Future fuEvents;

  String fuNewsLink = '/tr/page/news';
  String fuAnnoLink = '/tr/page/announcement';
  String fuEventLink = '/tr/page/event';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkInternetConn();
    fuNews = ScrapeData().getFuNewsEventAnno(restLink: fuNewsLink, page: 1);
    fuAnno = ScrapeData().getFuNewsEventAnno(restLink: fuAnnoLink, page: 1);
    fuEvents = ScrapeData().getFuNewsEventAnno(restLink: fuEventLink, page: 1);
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

  void changeTheme() {
    Provider.of<CustomThemeDataModal>(context, listen: false).setThemeData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // for responsive UI
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: ThemeService.instance.isDarkMode()
                  ? Colors.white
                  : Colors.black),
          centerTitle: true,
          title: Text(
            'FIRAT ÜNİVERSİTESİ',
            style: TextStyle(
                color: ThemeService.instance.isDarkMode()
                    ? Colors.white
                    : Colors.black87),
          ),
          flexibleSpace: Image.asset(
            ThemeService.instance.isDarkMode()
                ? "assets/img/footer-bg.png"
                : "assets/img/bg-pattern.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: ThemeService.instance.isDarkMode()
            ? Color(0xFF292D32)
            : Colors.grey[300],
        drawer: drawerDepartments(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              newsSection(fuNews, fuNewsList, context, 'Haberler', fuNewsLink),
              newsSection(fuAnno, fuAnnoList, context, 'Duyurular', fuAnnoLink),
              newsSection(
                  fuEvents, fuEventList, context, 'Etkinlikler', fuEventLink),
              facultySections(
                context,
                "Öğrenci İşleri Otomasyonu",
                "uni_ogrenciotomaston.jpg",
                "https://obs.firat.edu.tr/",
              ),
              facultySections(
                context,
                "Akademik Takvim",
                "uni_akademiktakvim.jpg",
                "http://www.firat.edu.tr/tr/document?file_category_id=66&menu_id=406",
              ),
              facultySections(
                context,
                "Kütüphane",
                "uni_kutuphane.jpeg",
                "http://ktarama.firat.edu.tr/yordambt/yordam.php",
              ),
              facultySections(
                context,
                "Üniversite Evi",
                "uni_evi.jpg",
                "http://uevi.firat.edu.tr/",
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  calculationArea("Vize Final (Proje) Hesapla", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VizeFinalPage()));
                  }),
                  SizedBox(width: 20),
                  calculationArea("Dönem Ortalaması Hesapla", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EndTermAverage()));
                  }),
                ],
              ),
              SizedBox(height: 20),
              Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMaps())
            ],
          ),
        ),
      ),
    );
  }

  Widget newsSection(Future myFuture, List myList, BuildContext context,
      String sectionTitle, String sectionLink) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Text(
            sectionTitle,
            style: TextStyle(
                fontSize: SizeConfig.screenHeight! > 600 ? 25 : 20,
                color: ThemeService.instance.isDarkMode()
                    ? Colors.grey
                    : Colors.black54),
          ),
        ),
        connectedInternet
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: FutureBuilder(
                  future: myFuture,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return circularLoader();
                    else if (snapshot.hasError)
                      return Center(child: Text("ERROR: ${snapshot.error}"));
                    else if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              myList.length > 10 ? 10 : myList.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            if (index <
                                (myList.length > 10 ? 10 : myList.length)) {
                              var title = myList[index].title;
                              var day = myList[index].day;
                              var month = myList[index].month;
                              var link = myList[index].link;
                              var imgLink = myList[index].imgLink;
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: 15, bottom: 10, top: 5),
                                child: Container(
                                  width: 130,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ThemeService.instance.isDarkMode()
                                          ? Color(0xFF292D32).withOpacity(.9)
                                          : Color(0xFF292D32).withOpacity(.2),
                                      boxShadow: [
                                        BoxShadow(
                                            color: ThemeService.instance
                                                    .isDarkMode()
                                                ? Colors.black.withOpacity(0.4)
                                                : Colors.black.withOpacity(0.1),
                                            offset: Offset(6.0, 6.0),
                                            blurRadius: 10.0,
                                            spreadRadius: 1.0),
                                      ]),
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyWebViews(myUrl: link))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          child: Container(
                                            height: 110,
                                            width: 150,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        imgLink.toString()),
                                                    fit: BoxFit.cover)),
                                            alignment: Alignment.bottomLeft,
                                            child: Container(
                                              color: Color(0xFF292D32)
                                                  .withOpacity(.6),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: Text(
                                                  '$day $month',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5.0,
                                              right: 5,
                                              top: 10,
                                              bottom: 5),
                                          child: Text(
                                            title.toString(),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else if (index ==
                                (myList.length > 10 ? 10 : myList.length)) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FuNewsEventAnno(
                                              pageLink: sectionLink,
                                              pageTitle: sectionTitle)));
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_right,
                                      size: 80,
                                    ),
                                    Text("Tüm $sectionTitle")
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          });
                    } else {
                      return circularLoader();
                    }
                  },
                ),
              )
            : noInternetConn(myIconSize: 25, myFontSize: 14),
      ],
    );
  }

  Widget calculationArea(String title, VoidCallback onTapRoute) {
    return GestureDetector(
      onTap: onTapRoute,
      child: Container(
        height: SizeConfig.orientation == Orientation.portrait ? 150 : 100,
        width: MediaQuery.of(context).size.width * 0.3,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: ThemeService.instance.isDarkMode()
                ? Color(0xFF292D32).withOpacity(.9)
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.calculate,
              size: 40,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget facultySections(
      BuildContext context, String title, String imgPath, String websiteLink) {
    return GestureDetector(
      onTap: () {
        title == 'Öğrenci İşleri Otomasyonu'
            ? launchURL(websiteLink)
            : Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => title == 'Üniversite Evi'
                        ? UniEvi()
                        : MyWebViews(myUrl: websiteLink)));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: SizeConfig.orientation == Orientation.portrait ? 175 : 125,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/img/$imgPath',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )),
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  title == 'Öğrenci İşleri Otomasyonu'
                      ? Text(
                          'Tarayıcıda Açmak için Tıklayınız',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        )
                      : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget drawerDepartments() {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: Drawer(
          child: Column(
            children: [
              drawerHeader(),
              Expanded(
                  flex: SizeConfig.screenHeight! > 600 ? 12 : 19,
                  child: ListView.builder(
                      //key: Key('builder ${selected.toString()}'), //attention
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: facultyDepartmentList.length,
                      itemBuilder: (BuildContext context, int i) {
                        List<DepartmentModel> departments = [];

                        facultyDepartmentList[i]['departments']
                            .map((department) =>
                                departments.add(DepartmentModel(
                                  departmentName: department['departmentName'],
                                  departmentCode: department['departmentCode'],
                                  departmentPath: department['departmentPath'],
                                )))
                            .toList();
                        return ListTileTheme(
                          tileColor: ThemeService.instance.isDarkMode()
                              ? Theme.of(context).bottomAppBarColor
                              : Theme.of(context).buttonColor,
                          child: ExpansionTile(
                            childrenPadding: EdgeInsets.all(8),
                            key: Key(i.toString()), //attention
                            //initiallyExpanded: i == selected, //attention

                            title: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                facultyDepartmentList[i]['facultyName'],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            // onExpansionChanged: ((newState) {
                            //   if (newState)
                            //     setState(() {
                            //       Duration(seconds: 20000);
                            //       selected = i;
                            //     });
                            //   else
                            //     setState(() {
                            //       selected = -1;
                            //     });
                            // }),
                            children: [
                              ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: departments.length,
                                  itemBuilder: (BuildContext context, int j) {
                                    return listTileDepartments(
                                        facultyName: facultyDepartmentList[i]
                                            ['facultyName'],
                                        department: departments[j]);
                                  }),
                            ],
                          ),
                        );
                      })),
              SizedBox(height: 5),
              Expanded(
                flex: SizeConfig.screenHeight! > 600 ? 1 : 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => changeTheme(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('THEME'),
                            SizedBox(
                                width: SizeConfig.orientation ==
                                        Orientation.portrait
                                    ? 10
                                    : 5),
                            Icon(
                              ThemeService.instance.isDarkMode()
                                  ? Icons.light_mode
                                  : Icons.dark_mode,
                              size:
                                  SizeConfig.orientation == Orientation.portrait
                                      ? 22
                                      : 17,
                              color: ThemeService.instance.isDarkMode()
                                  ? Colors.white
                                  : Colors.black,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: SizeConfig.orientation == Orientation.portrait
                              ? 4
                              : 1),
                      Text(
                        'S M N C',
                        style: TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }

  Widget listTileDepartments(
      {String? facultyName, DepartmentModel? department}) {
    return GestureDetector(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            department!.departmentName,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      onTap: () {
        announcements.clear();
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DepartmentPage(
                      facultyName: facultyName,
                      departmentName: department.departmentName,
                      departmentCode: department.departmentCode,
                    )));
      },
    );
  }

  Widget drawerHeader() {
    return SizedBox(
      height: SizeConfig.orientation == Orientation.portrait ? 140 : 90,
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            //color: Colors.black38,
            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     image: AssetImage('assets/img/bg-pattern.png')),
            ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // ClipRRect(
            //     child: Image(
            //   image: AssetImage('assets/img/logo-area2.png'),
            //   width: MediaQuery.of(context).size.width*0.8,
            //   height: 140,
            //   fit: BoxFit.cover,
            // )),
            ClipRRect(
                child: Container(
              color: Colors.black38,
              child: Image(
                image: AssetImage('assets/img/footer-bg.png'),
                fit: BoxFit.cover,
                height:
                    SizeConfig.orientation == Orientation.portrait ? 140 : 90,
              ),
            )),
            Image(
                width:
                    SizeConfig.orientation == Orientation.portrait ? 130 : 90,
                height:
                    SizeConfig.orientation == Orientation.portrait ? 130 : 90,
                image: AssetImage('assets/img/firat-white.png'))
          ],
        ),
      ),
    );
  }
}
