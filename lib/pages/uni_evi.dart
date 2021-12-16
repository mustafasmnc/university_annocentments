import 'package:flutter/material.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';

class UniEvi extends StatefulWidget {
  const UniEvi({Key? key}) : super(key: key);

  @override
  _UniEviState createState() => _UniEviState();
}

class _UniEviState extends State<UniEvi> {
  late Future getMealList;
  @override
  void initState() {
    getMealList = ScrapeData().getMeals();
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
      body: Container(
          child: FutureBuilder(
        future: getMealList,
        builder: (context, snapshot) {
          return Column(
            children: [
              SizedBox(height: 50),
              MenuItems(menuItem: mealDate),
              ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: mealList.length,
                itemBuilder: (context, index) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());
                  else if (snapshot.hasError)
                    return Center(child: Text("ERROR: ${snapshot.error}"));
                  else if (snapshot.hasData) {
                    return MenuItems(menuItem: mealList[index]);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          );
        },
      )),
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
