import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/model/department_model.dart';
import 'package:webscraping/core/model/google_maps.dart';
import 'package:webscraping/core/theme/theme_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/pages/department_page.dart';
import 'package:webscraping/pages/web_views.dart';

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
      drawer: drawerDepartments(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            facultySections(context, "Öğrenci İşleri Otomasyonu",
                "uni_ogrenciotomaston.jpg", "https://obs.firat.edu.tr/"),
            facultySections(
                context,
                "Akademik Takvim",
                "uni_akademiktakvim.jpg",
                "http://www.firat.edu.tr/tr/document?file_category_id=66&menu_id=406"),
            facultySections(context, "Kütüphane", "uni_kutuphane.jpeg",
                "http://kutuphane.db.firat.edu.tr/"),
            facultySections(context, "Üniversite Evi", "uni_evi.jpg",
                "http://uevi.firat.edu.tr/"),
            Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: GoogleMaps())
          ],
        ),
      ),
    );
  }

  Column facultySections(
      BuildContext context, String title, String imgPath, String websiteLink) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyWebViews(myUrl: websiteLink))),
          child: Container(
            padding: EdgeInsets.all(10),
            height: 200,
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
        )
      ],
    );
  }

  Widget drawerDepartments() {
    return Drawer(
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
                        .map((department) => departments.add(DepartmentModel(
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
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('THEME'),
                      SizedBox(width: 10),
                      GestureDetector(
                          onTap: () => changeTheme(),
                          child: Icon(
                            ThemeService.instance.isDarkMode()
                                ? Icons.wb_sunny
                                : Icons.nightlight_round,
                            size: 24,
                            color: ThemeService.instance.isDarkMode()
                                ? Colors.white
                                : Colors.black,
                          ))
                    ],
                  ),
                  SizedBox(height: 8),
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
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/img/bg-pattern.png'))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
              child: Image(image: AssetImage('assets/img/logo-area2.png'))),
          Image(
              width: 150,
              height: 150,
              image: AssetImage('assets/img/firat-white.png'))
        ],
      ),
    );
  }
}
