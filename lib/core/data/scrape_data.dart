import 'package:web_scraper/web_scraper.dart';
import 'package:webscraping/core/model/anno_model.dart';
List<AnnoModel> announcements = [];
class ScrapeData {
  
  Future scraping(String code) async {
    announcements.clear();
    String MAIN_LINK = 'http://$code.firat.edu.tr';
    String ANNO_LINK = '/tr/announcements-all';
    int PAGE_NUM = 1;
    final webScraper = WebScraper(MAIN_LINK);
    //final List titleList = <String>[];
    for (var i = 1; i < 4; i++) {
      if (await webScraper.loadWebPage('$ANNO_LINK/$i')) {
        var titleElements = webScraper.getElement(
            'div.announcements > div.announcements-inner > div.anno-details > a > strong > p.anno-details-title',
            []);
        var linkElements = webScraper.getElementAttribute(
            'div.announcements > div.announcements-inner > div.anno-details > a ',
            'href');
        //print(titleElements);
        // titleElements.forEach((element) {
        //   final title = element['title'].replaceAll('  ', '');
        //   titleList.add('$title');
        // });

        for (int i = 0; i < linkElements.length; i++) {
          var title = titleElements[i]['title']
              .replaceAll(new RegExp("  "), "")
              .trimRight();
          var link = linkElements[i];
          //print("$title");
          var pieces = link!.split('/');
          var id = int.parse(pieces[pieces.length - 1]);
          announcements.add(AnnoModel(id: id, title: title, link: link));
        }
      }
    }
    return announcements;
  }
}
