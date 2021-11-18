import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/model/anno_model.dart';
import 'package:webscraping/core/view_model/announcements.dart';

class TekYaz extends StatefulWidget {
  const TekYaz({Key? key}) : super(key: key);

  @override
  _TekYazState createState() => _TekYazState();
}

class _TekYazState extends State<TekYaz> {
  late Future getData;

  @override
  void initState() {
    getData = ScrapeData().scraping();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FutureBuilder(
            future: getData,
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: ScrapeData.announcements.length,
                    itemBuilder: (BuildContext context, int index) {
                      var id = ScrapeData.announcements[index].id;
                      var title = ScrapeData.announcements[index].title;
                      var link = ScrapeData.announcements[index].link;
                      return Announcements(
                        id: id,
                        title: title,
                        link: link,
                      );
                    });
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
