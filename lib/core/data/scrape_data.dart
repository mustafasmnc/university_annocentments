import 'dart:io';

import 'package:web_scraper/web_scraper.dart';
import 'package:webscraping/core/model/anno_model.dart';

List<AnnoModel> announcements = [];
List mealList = [];
var mealDate;

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

  Future getMeals() async {
    String MEAL_LINK = 'http://uevi.mdr.firat.edu.tr';
    final webScraper = WebScraper(MEAL_LINK);
    var meals;
    if (await webScraper.loadWebPage('/tr')) {
      mealDate = webScraper.getElement(
          'div.content-header > h5 ',
          []);
      meals = webScraper.getElement(
          'div.content-inner > div.contain > div.contain-text > h5 ', []);
    }
    mealDate = mealDate[0]['title'];
    mealList.clear();
    for (int i = 0; i < meals.length; i++) {
      var meal = meals[i]['title'];
      mealList.add(meal);
      //print('date:$mealDate  / meal: $meal');
    }
    return mealList;
  }

  Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
