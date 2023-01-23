import 'dart:io';

import 'package:web_scraper/web_scraper.dart';
import 'package:webscraping/core/model/anno_model.dart';

String fuNewsLink = '/tr/page/news';
String fuAnnoLink = '/tr/page/announcement';
String fuEventLink = '/tr/page/event';

List<AnnoModel> announcements = [];
List<AnnoModel> news = [];
List<AnnoModel> fuNewsList = [];
List<AnnoModel> fuAnnoList = [];
List<AnnoModel> fuEventList = [];
List mealList = [];
var mealDate;

class ScrapeData {
  List<AnnoModel> getOnlyXItem(List list, int x) {
    List<AnnoModel> a = [];
    for (int i = 0; i < x; i++) {
      a.add(list[i]);
    }
    return a;
  }

  Future getDepAnno({required String code, required int page}) async {
    try {
      String mainLink = 'http://$code.firat.edu.tr';
      String annoLink = '/tr/announcements-all';
      final webScraper = WebScraper(mainLink);
      //final List titleList = <String>[];
      var titleElements;
      var dayElements;
      var monthElements;
      var linkElements;
      for (var i = 1; i <= page; i++) {
        if (await webScraper.loadWebPage('$annoLink/$i')) {
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
            .replaceAll(RegExp("  "), "")
            .trimRight()
            .trimLeft();
        var link = linkElements[i];
        var day = dayElements[i]['title']
            .replaceAll(RegExp(r'  \n'), "")
            .trimRight()
            .trimLeft();

        var month = monthElements[i]['title']
            .replaceAll(RegExp(r'  \n'), "")
            .trimRight()
            .trimLeft();

        //print("$month / $day");
        var pieces = link!.split('/');
        var id = int.parse(pieces[pieces.length - 1]);
        announcements.add(AnnoModel(
            id: id, title: title, day: day, month: month, link: link));
      }
      return announcements;
    } catch (e) {
      return e.toString();
    }
  }

  Future getDepNews({required String code, required int page}) async {
    try {
      String mainLink = 'http://$code.firat.edu.tr';
      String newsLink = '/tr/news-all';
      final webScraper = WebScraper(mainLink);
      //final List titleList = <String>[];
      var titleElements;
      var descElements;
      var dayElements;
      var monthElements;
      var linkElements;
      var imgElements;
      for (var i = 1; i <= page; i++) {
        if (await webScraper.loadWebPage('$newsLink/$i')) {
          titleElements = webScraper.getElement(
              'div.news > div.news-inner > div.news-details > a > strong > p.news-details-title',
              []);
          descElements = webScraper.getElement(
              'div.news > div.news-inner > div.news-details > a >p', []);
          dayElements = webScraper.getElement(
              'div.news > div.news-inner > div.news-image-date > div.news-date > div.news-month-day > div.news-day-number ',
              []);
          monthElements = webScraper.getElement(
              'div.news > div.news-inner > div.news-image-date > div.news-date > div.news-month-day > div.news-month ',
              []);
          linkElements = webScraper.getElementAttribute(
              'div.news > div.news-inner > div.news-details > a ', 'href');
          imgElements = webScraper.getElementAttribute(
              'div.news > div.news-inner > div.news-image-date > div.news-image > a > img ',
              'src');
          //print(descElements);
          // titleElements.forEach((element) {
          //   final title = element['title'].replaceAll('  ', '');
          //   titleList.add('$title');
          // });

        }
      }
      for (int i = 0; i < linkElements.length; i++) {
        var title = titleElements[i]['title']
            .replaceAll(RegExp("  "), "")
            .trimRight()
            .trimLeft();
        var desc = descElements[i]['title']
            .replaceAll(RegExp("  "), "")
            .trimRight()
            .trimLeft();
        var link = linkElements[i];
        var day = dayElements[i]['title']
            .replaceAll(RegExp(r'  \n'), "")
            .trimRight()
            .trimLeft();

        var month = monthElements[i]['title']
            .replaceAll(RegExp(r'  \n'), "")
            .trimRight()
            .trimLeft();

        var img = mainLink + imgElements[i];

        //print("$month / $day");
        var pieces = link!.split('/');
        var id = int.parse(pieces[pieces.length - 1]);
        news.add(AnnoModel(
            id: id,
            title: title,
            day: day,
            month: month,
            link: link,
            desc: desc,
            imgLink: img));
      }
      return news;
    } catch (e) {
      return e.toString();
    }
  }

  Future getFuNewsEventAnno({required String restLink, int page = 1}) async {
    try {
      String mainLink = 'http://www.firat.edu.tr';
      final webScraper = WebScraper(mainLink);
      var titleElements;
      var descElements;
      var dayElements;
      var monthElements;
      var linkElements;
      var imglinkElements;
      for (var i = 1; i <= page; i++) {
        if (await webScraper.loadWebPage('$restLink?page=$i')) {
          titleElements =
              webScraper.getElement('div.item-content > h3.title > a', []);
          descElements = webScraper.getElement(
              'div.item-content > div.item-excerpt.blog-item-excerpt > p', []);
          dayElements = webScraper.getElement('div.day', []);
          monthElements = webScraper.getElement('div.month', []);
          linkElements = webScraper.getElementAttribute(
              'div.item-content > h3.title > a', 'href');
          imglinkElements = webScraper.getElementAttribute(
              'div.item-thumbnail > a > img ', 'src');
        }
      }

      for (var i = 0; i < linkElements.length; i++) {
        var title = titleElements[i]['title']
            .replaceAll(RegExp("  "), "")
            .trimRight()
            .trimLeft();
        var desc = descElements[i]['title']
            .replaceAll(RegExp("  "), "")
            .trimRight()
            .trimLeft();
        var link = linkElements[i];
        var imgLink = imglinkElements[i];
        var day = dayElements[i]['title']
            .replaceAll(RegExp(r'  \n'), "")
            .trimRight()
            .trimLeft();

        var month = monthElements[i]['title']
            .replaceAll(RegExp(r'  \n'), "")
            .trimRight()
            .trimLeft();
        //print("$month-$day/$title/$imgLink/$link");
        if (restLink == '/tr/page/news') {
          fuNewsList.add(AnnoModel(
              title: title,
              desc: desc,
              day: day,
              month: month,
              link: link,
              imgLink: imgLink));
        }
        if (restLink == '/tr/page/announcement') {
          fuAnnoList.add(AnnoModel(
              title: title,
              desc: desc,
              day: day,
              month: month,
              link: link,
              imgLink: imgLink));
        }
        if (restLink == '/tr/page/event') {
          fuEventList.add(AnnoModel(
              title: title,
              desc: desc,
              day: day,
              month: month,
              link: link,
              imgLink: imgLink));
        }
      }
      return fuNewsList;
    } catch (e) {
      return e.toString();
    }
  }

  Future lastAnnoIdScraping(String code) async {
    String mainLink = 'http://$code.firat.edu.tr';
    String annoLink = '/tr/announcements-all';
    int PAGE_NUM = 1;
    final webScraper = WebScraper(mainLink);
    var linkElements;
    if (await webScraper.loadWebPage('$annoLink/$PAGE_NUM')) {
      linkElements = webScraper.getElementAttribute(
          'div.announcements > div.announcements-inner > div.anno-details > a ',
          'href');
    }
    var link = linkElements[0];
    var pieces = link!.split('/');
    var id = int.parse(pieces[pieces.length - 1]);
    return id;
  }

  Future getMeals() async {
    try {
      String mealLink = 'http://uevi.mdr.firat.edu.tr';
      final webScraper = WebScraper(mealLink);
      var meals;
      var date;
      if (await webScraper.loadWebPage('/')) {
        date = webScraper.getElement('div.content-header > h5 ', []);
        meals = webScraper.getElement(
            'div.content-inner > div.contain > div.contain-text > h5 ', []);
      }
      mealDate = date[0]['title'];

      mealList.clear();
      for (int i = 0; i < meals.length; i++) {
        var meal = meals[i]['title'];
        mealList.add(meal);
        //print('date:$mealDate  / meal: $meal');
      }
      return mealList;
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}
