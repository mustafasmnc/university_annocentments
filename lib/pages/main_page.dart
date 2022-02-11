import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/model/department_model.dart';
import 'package:webscraping/core/model/google_maps.dart';
import 'package:webscraping/core/theme/theme_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/pages/department_page.dart';
import 'package:webscraping/pages/endtermaverage_page.dart';
import 'package:webscraping/pages/uni_evi.dart';
import 'package:webscraping/pages/vizefinal_page.dart';
import 'package:webscraping/pages/web_views.dart';
import 'package:webscraping/pages/web_views_pdf.dart';
import 'package:webscraping/size_config.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected = 0;

  void changeTheme() {
    Provider.of<CustomThemeDataModal>(context, listen: false).setThemeData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // for responsive UI
    return Scaffold(
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VizeFinalPage()));
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
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: GoogleMaps())
          ],
        ),
      ),
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
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => title == 'Üniversite Evi'
                  ? UniEvi()
                  : MyWebViews(myUrl: websiteLink))),
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
                color: Colors.black26,
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
                  flex: 11,
                  child: ListView.builder(
                      key: Key('builder ${selected.toString()}'), //attention
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
                            initiallyExpanded: i == selected, //attention

                            title: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Text(
                                facultyDepartmentList[i]['facultyName'],
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            onExpansionChanged: ((newState) {
                              if (newState)
                                setState(() {
                                  Duration(seconds: 20000);
                                  selected = i;
                                });
                              else
                                setState(() {
                                  selected = -1;
                                });
                            }),
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
                flex: SizeConfig.orientation == Orientation.portrait ? 1 : 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('THEME'),
                          SizedBox(
                              width:
                                  SizeConfig.orientation == Orientation.portrait
                                      ? 10
                                      : 5),
                          GestureDetector(
                              onTap: () => changeTheme(),
                              child: Icon(
                                ThemeService.instance.isDarkMode()
                                    ? Icons.wb_sunny
                                    : Icons.nightlight_round,
                                size: SizeConfig.orientation ==
                                        Orientation.portrait
                                    ? 24
                                    : 17,
                                color: ThemeService.instance.isDarkMode()
                                    ? Colors.white
                                    : Colors.black,
                              ))
                        ],
                      ),
                      SizedBox(
                          height: SizeConfig.orientation == Orientation.portrait
                              ? 8
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
      height: SizeConfig.orientation == Orientation.portrait ? 150 : 100,
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
                image: AssetImage(
                    Provider.of<CustomThemeDataModal>(context).getThemeData ==
                            ThemeData.dark()
                        ? 'assets/img/footer-bg.png'
                        : 'assets/img/bg-pattern.png'),
                fit: BoxFit.cover,
                height:
                    SizeConfig.orientation == Orientation.portrait ? 150 : 100,
              ),
            )),
            Image(
                width:
                    SizeConfig.orientation == Orientation.portrait ? 140 : 90,
                height:
                    SizeConfig.orientation == Orientation.portrait ? 140 : 90,
                image: AssetImage('assets/img/firat-white.png'))
          ],
        ),
      ),
    );
  }
}
