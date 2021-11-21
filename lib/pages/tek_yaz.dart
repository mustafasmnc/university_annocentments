import 'package:flutter/material.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/view_model/announcements.dart';

class TekYaz extends StatefulWidget {
  String? departmentCode;
  TekYaz({Key? key, required this.departmentCode}) : super(key: key);

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
      appBar: AppBar(),
      body: FutureBuilder(
          future: ScrapeData().scraping(widget.departmentCode!),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: announcements.length,
                  itemBuilder: (BuildContext context, int index) {
                    var id = announcements[index].id;
                    var title = announcements[index].title;
                    var link = announcements[index].link;
                    return Announcements(
                      id: id,
                      title: title,
                      link: link,
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
