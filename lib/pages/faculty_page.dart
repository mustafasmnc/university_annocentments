import 'package:flutter/material.dart';
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
        title: Row(
          children: [
            Image.network(
              "http://tf.firat.edu.tr/assets/front/images/firat-wihte.png",
              width: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Text('TEKNOLOJİ FAKÜLTESİ'),
          ],
        ),
        flexibleSpace: Image.network(
          "http://tf.firat.edu.tr/assets/front/images/footer-bg.png",
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TekYaz())),
              child: Text("Yazılım Mühendisliği"))
        ],
      ),
    );
  }
}
