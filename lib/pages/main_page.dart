import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:webscraping/pages/uni_evi.dart';

import '../app_icons.dart';
import '../core/data/scrape_data.dart';
import '../core/theme/app_colors.dart';
import '../core/view_model/custom_slide_route.dart';
import '../core/view_model/my_slider.dart';
import '../core/view_model/widgets/custom_button.dart';
import '../core/view_model/widgets/top_background.dart';
import '../core/view_model/widgets/widgets.dart';
import 'endtermaverage_page.dart';
import 'fu_news_event_anno.dart';
import 'vizefinal_page.dart';

class MainPage extends StatefulWidget {
  final RateMyApp? rateMyApp;
  const MainPage({Key? key, this.rateMyApp}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final CarouselController _newsController = CarouselController();
  final CarouselController _eventsController = CarouselController();
  final CarouselController _annoController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 330,
              child: Stack(children: [
                const TopBackground(
                  height: 230.00,
                ),
                Positioned(
                    top: 50,
                    left: 15,
                    child: InkWell(
                        onTap: (() => ZoomDrawer.of(context)!.toggle.call()),
                        child: const Icon(
                          AppIcons.menuLeft,
                          color: Colors.white,
                        ))),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 90),
                    child: fuNewsList.isNotEmpty
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: MySlider(
                              sectionName: 'news',
                              controller: _newsController,
                              myList: fuNewsList,
                              height: 200,
                              showDots: true,
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                            ))
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: customScaffoldColor(context),
                            ),
                            height: 200,
                            child: Center(
                              child: errorMsg(),
                            ),
                          ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Hızlı Menü', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: menuTextColor(context),
                    height: 1,
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        quickMenu(
                          title: 'Yemekhane',
                          icon: const Icon(Icons.restaurant),
                          onTap: () => Navigator.push(
                              context,
                              CustomSlideRoute(
                                  page: const UniEvi(), x: 0, y: 1)),
                        ),
                        quickMenu(
                          title: 'OBS',
                          icon: const Icon(Icons.info),
                          onTap: () => launchURL('https://obs.firat.edu.tr/'),
                        ),
                        quickMenu(
                          title: 'Kütüphane',
                          icon: const Icon(Icons.menu_book_outlined),
                          onTap: () => launchURL(
                              'http://ktarama.firat.edu.tr/yordambt/yordam.php'),
                        ),
                        quickMenu(
                            title: 'Akademik Takvim',
                            icon: const Icon(Icons.calendar_month),
                            onTap: () => launchURL(
                                'http://www.firat.edu.tr/tr/document?file_category_id=66&menu_id=406')),
                        quickMenu(
                          title: 'E-Posta',
                          icon: const Icon(Icons.email),
                          onTap: () => launchURL('https://posta.firat.edu.tr/'),
                        ),
                        quickMenu(
                          title: 'Uzaktan Eğitim',
                          icon: const Icon(Icons.wifi),
                          onTap: () =>
                              launchURL('http://uzaktanegitim.firat.edu.tr/'),
                        ),
                        quickMenu(
                          title: 'Tüm Hızlı Linkler',
                          icon: const Icon(Icons.apps),
                          onTap: () => launchURL(
                              'https://www.firat.edu.tr/tr/page/logo'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Etkinlikler', style: TextStyle(fontSize: 18)),
                      CustomButton(
                        title: 'Tümü',
                        onTap: () => Navigator.push(
                            context,
                            CustomSlideRoute(
                                page: FuNewsEventAnno(
                                    pageLink: fuEventLink,
                                    pageTitle: 'Etkinlikler'),
                                x: 0,
                                y: 1)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: menuTextColor(context),
                    height: 1,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: fuEventList.isNotEmpty
                        ? MySlider(
                            sectionName: 'events',
                            controller: _eventsController,
                            myList: fuEventList,
                            height: 200,
                            showDots: false,
                            viewportFraction: 0.35,
                            enlargeCenterPage: true,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: customScaffoldColor(context),
                            ),
                            height: 200,
                            child: Center(
                              child: errorMsg(),
                            ),
                          ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Duyurular', style: TextStyle(fontSize: 18)),
                      CustomButton(
                        title: 'Tümü',
                        onTap: () => Navigator.push(
                            context,
                            CustomSlideRoute(
                                page: FuNewsEventAnno(
                                    pageLink: fuAnnoLink,
                                    pageTitle: 'Duyurular'),
                                x: 0,
                                y: 1)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: menuTextColor(context),
                    height: 1,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: fuAnnoList.isNotEmpty
                          ? MySlider(
                              sectionName: 'announcements',
                              controller: _annoController,
                              myList: fuAnnoList,
                              height: 120,
                              width: 500,
                              showDots: false,
                              viewportFraction: 0.52,
                              enlargeCenterPage: true,
                            )
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: customScaffoldColor(context),
                              ),
                              height: 200,
                              child: Center(
                                child: errorMsg(),
                              ),
                            )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculationArea("Vize Final (Proje) Hesapla", () {
                  Navigator.push(
                      context,
                      CustomSlideRoute(
                          page: const VizeFinalPage(), x: 0, y: 1));
                }),
                const SizedBox(width: 20),
                calculationArea("Dönem Ortalaması Hesapla", () {
                  Navigator.push(
                      context,
                      CustomSlideRoute(
                          page: const EndTermAverage(), x: 0, y: 1));
                }),
              ],
            ),
            const SizedBox(height: 20),
            socialSection()
          ],
        ),
      ),
    );
  }

  Widget quickMenu({String? title, Icon? icon, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 120,
          child: Column(
            children: [
              Container(
                  height: 65,
                  width: 65,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: customTileColor(context),
                  ),
                  child: icon),
              const SizedBox(height: 5),
              SizedBox(
                width: 75,
                child: Text(
                  title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget calculationArea(String title, VoidCallback onTapRoute) {
    return InkWell(
      onTap: onTapRoute,
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.3,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: customTileColor(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.calculate,
              size: 40,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  socialSection() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          socialAccounts('assets/img/twitter.png',
              () => launchURL('https://twitter.com/firatresmihesap')),
          socialAccounts(
              'assets/img/linkedin.png',
              () => launchURL(
                  'https://www.linkedin.com/school/firat-university/')),
          socialAccounts('assets/img/facebook.png',
              () => launchURL('https://www.facebook.com/frtbasinyayin')),
          socialAccounts(
              'assets/img/youtube.png',
              () => launchURL(
                  'https://www.youtube.com/c/F%C4%B1rat%C3%9CniversitesiResmiHesab%C4%B1')),
        ],
      ),
    );
  }

  socialAccounts(String imageString, VoidCallback onTap) {
    return SizedBox(
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          imageString,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
