import 'package:flutter/material.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/view_model/announcements.dart';

class TekYaz extends StatefulWidget {
  String? departmentName;
  String? departmentCode;
  TekYaz({Key? key, this.departmentName, required this.departmentCode})
      : super(key: key);

  @override
  _TekYazState createState() => _TekYazState();
}

class _TekYazState extends State<TekYaz> {
  //late Future getData;

  // @override
  // void initState() {
  //   getData = ScrapeData().scraping(widget.departmentCode!);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(widget.departmentName.toString(),style: TextStyle(fontSize: 14),),
            Text('DUYURULAR'),
          ],
        ),
        flexibleSpace: Image.asset(
          "assets/img/footer-bg.png",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
          future: ScrapeData().scraping(widget.departmentCode!),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
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
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
