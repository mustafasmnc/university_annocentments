import 'package:flutter/material.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/core/view_model/announcements.dart';

class TekYaz extends StatefulWidget {
  String? facultyName;
  String? departmentName;
  String? departmentCode;
  TekYaz({
    Key? key,
    this.departmentName,
    this.facultyName,
    required this.departmentCode,
  }) : super(key: key);

  @override
  _TekYazState createState() => _TekYazState();
}

class _TekYazState extends State<TekYaz> {
  late Future getData;
  int page = 1;
  bool loading = false;
  bool checkbox = false;

  @override
  void initState() {
    getData = ScrapeData().scraping(code: widget.departmentCode!, page: 1);
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
        title: Column(
          children: [
            Text(
              widget.facultyName.toString(),
              style: TextStyle(
                  fontSize: 13,
                  color: ThemeService.instance.isDarkMode()
                      ? Colors.white
                      : Colors.black87),
            ),
            Text(
              widget.departmentName.toString(),
              style: TextStyle(
                  fontSize: 15,
                  color: ThemeService.instance.isDarkMode()
                      ? Colors.white
                      : Colors.black87),
            ),
            Text('DUYURULAR',
                style: TextStyle(
                    fontSize: 17,
                    color: ThemeService.instance.isDarkMode()
                        ? Colors.white
                        : Colors.black87)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bildirim"),
                SizedBox(height: 5),
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Checkbox(
                    checkColor: Colors.white,
                    //fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: checkbox,
                    onChanged: (bool? value) {
                      setState(() {
                        checkbox = value!;
                      });
                    },
                  ),
                )
              ],
            ),
          )
        ],
        flexibleSpace: Image.asset(
          ThemeService.instance.isDarkMode()
              ? "assets/img/footer-bg.png"
              : "assets/img/bg-pattern.png",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          FutureBuilder(
              future: getData,
              builder: (BuildContext context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return circularLoader();
                else if (snapshot.hasError)
                  return Center(child: Text("ERROR: ${snapshot.error}"));
                else if (snapshot.hasData) {
                  return ListView(
                    children: [
                      ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: announcements.length,
                          itemBuilder: (BuildContext context, int index) {
                            var id = announcements[index].id;
                            var title = announcements[index].title;
                            var day = announcements[index].day;
                            var month = announcements[index].month;
                            var link = announcements[index].link;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Announcements(
                                id: id,
                                title: title,
                                day: day,
                                month: month,
                                link: link,
                              ),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: GestureDetector(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });

                            page++;
                            await ScrapeData()
                                .scraping(
                                    code: widget.departmentCode!, page: page)
                                .then((value) {
                              setState(() {
                                loading = false;
                              });
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: AssetImage("assets/img/title-bg.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Text(
                              "Daha Fazla Duyuru",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return circularLoader();
                }
              }),
          loading ? circularLoader() : Container()
        ],
      ),
    );
  }

  Container circularLoader() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black38,
        ),
        child: Center(child: CircularProgressIndicator()));
  }
}
