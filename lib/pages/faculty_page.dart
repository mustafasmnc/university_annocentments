import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webscraping/core/model/department_model.dart';
import 'package:webscraping/core/model/google_maps.dart';
import 'package:webscraping/pages/tek_yaz.dart';
import 'package:webscraping/pages/web_views.dart';

class FacultyPage extends StatefulWidget {
  const FacultyPage({Key? key}) : super(key: key);

  @override
  _FacultyPageState createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Image.asset(
              "assets/img/firat-white.png",
              width: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Text('TEKNOLOJİ FAKÜLTESİ'),
          ],
        ),
        flexibleSpace: Image.asset(
          "assets/img/footer-bg.png",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      drawer: drawerDepartments(),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              facultySections(
                  context,
                  "Öğrenci İşleri Otomasyonu",
                  "https://www.creatrixcampus.com/sites/default/files/styles/image_1200x700/public/2019-05/benefits-of-student-information-system.jpg?itok=5_KSMYS5",
                  "https://obs.firat.edu.tr/"),
              facultySections(
                  context,
                  "Akademik Takvim",
                  "https://i.ibb.co/m98xXF1/third-month-calendar-wallpaper-designs-march-51351.jpg",
                  "http://www.firat.edu.tr/tr/document?file_category_id=66&menu_id=406"),
              facultySections(
                  context,
                  "Kütüphane",
                  "https://cdn.yeniakit.com.tr/images/news/625/firat-universitesi-gelecek-elinizin-altinda-h1596803067-452435.jpeg",
                  "http://kutuphane.db.firat.edu.tr/"),
              facultySections(
                  context,
                  "Üniversite Evi",
                  "https://thumbs.dreamstime.com/b/elegant-seamless-pattern-healthy-nutrition-fresh-dietary-food-eco-natural-organic-fruits-berries-vegetables-white-142956625.jpg",
                  "http://uevi.firat.edu.tr/"),
              Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMaps())
            ],
          ),
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
                  child: Image.network(
                    //"http://tf.firat.edu.tr/assets/front/images/bg-pattern.png",
                    //"http://tf.firat.edu.tr/assets/front/images/footer-bg.png",
                    //"https://www.creatrixcampus.com/sites/default/files/styles/image_1200x700/public/2019-05/benefits-of-student-information-system.jpg?itok=5_KSMYS5",
                    imgPath,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
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
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                itemCount: DepartmentModel.departmentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return listTileDepartments(
                      name:
                          DepartmentModel.departmentList[index].departmentName,
                      path:
                          DepartmentModel.departmentList[index].departmentPath,
                      code:
                          DepartmentModel.departmentList[index].departmentCode);
                }),
          ),
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
                      Icon(Icons.wb_sunny)
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'S M N C',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }

  Widget listTileDepartments(
      {String? name, String? path, required String code}) {
    // return ListTile(
    //   title: Text(
    //     name!,
    //     style: TextStyle(fontSize: 16),
    //   ),
    //   onTap: () {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => TekYaz(
    //                   departmentCode: code,
    //                 )));
    //   },
    // );
    return GestureDetector(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name!,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TekYaz(
                      departmentName: name,
                      departmentCode: code,
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
