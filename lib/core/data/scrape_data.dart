import 'package:web_scraper/web_scraper.dart';
import 'package:webscraping/core/model/anno_model.dart';

List<AnnoModel> announcements = [];

class ScrapeData {
  Future scraping({required String code, required int page}) async {
    String MAIN_LINK = 'http://$code.firat.edu.tr';
    String ANNO_LINK = '/tr/announcements-all';
    final webScraper = WebScraper(MAIN_LINK);
    //final List titleList = <String>[];
    var titleElements;
    var dayElements;
    var monthElements;
    var linkElements;
    for (var i = 1; i <= page; i++) {
      if (await webScraper.loadWebPage('$ANNO_LINK/$i')) {
        titleElements = webScraper.getElement(
            'div.announcements > div.announcements-inner > div.anno-details > a > strong > p.anno-details-title',
            []);
        dayElements = webScraper.getElement(
            'div.announcements > div.announcements-inner > div.anno-image-date > div.anno-date > div.anno-month-day > div.anno-day-number ',
            []);
        monthElements = webScraper.getElement(
            'div.announcements > div.announcements-inner > div.anno-image-date > div.anno-date > div.anno-month-day > div.anno-month ',
            []);
        linkElements = webScraper.getElementAttribute(
            'div.announcements > div.announcements-inner > div.anno-details > a ',
            'href');
        //print(titleElements);
        // titleElements.forEach((element) {
        //   final title = element['title'].replaceAll('  ', '');
        //   titleList.add('$title');
        // });

      }
    }
    for (int i = 0; i < linkElements.length; i++) {
      var title = titleElements[i]['title']
          .replaceAll(new RegExp("  "), "")
          .trimRight()
          .trimLeft();
      var link = linkElements[i];
      var day = dayElements[i]['title']
          .replaceAll(new RegExp(r'  \n'), "")
          .trimRight()
          .trimLeft();
      ;
      var month = monthElements[i]['title']
          .replaceAll(new RegExp(r'  \n'), "")
          .trimRight()
          .trimLeft();
      ;
      //print("$month / $day");
      var pieces = link!.split('/');
      var id = int.parse(pieces[pieces.length - 1]);
      announcements.add(
          AnnoModel(id: id, title: title, day: day, month: month, link: link));
    }
    return announcements;
  }

  Future lastAnnoIdScraping(String code) async {
    String MAIN_LINK = 'http://$code.firat.edu.tr';
    String ANNO_LINK = '/tr/announcements-all';
    int PAGE_NUM = 1;
    final webScraper = WebScraper(MAIN_LINK);
    var linkElements;
    if (await webScraper.loadWebPage('$ANNO_LINK/$PAGE_NUM')) {
      linkElements = webScraper.getElementAttribute(
          'div.announcements > div.announcements-inner > div.anno-details > a ',
          'href');
    }
    var link = linkElements[0];
    var pieces = link!.split('/');
    var id = int.parse(pieces[pieces.length - 1]);
    return id;
  }
}
