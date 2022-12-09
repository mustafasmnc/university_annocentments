import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/data/scrape_data.dart';
import '../../core/model/anno_model.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/ui_parameters.dart';
import '../../pages/fu_news_event_anno.dart';
import '../controller/home_page_controller.dart';
import 'custom_slide_route.dart';
import 'widgets/custom_button.dart';
import 'widgets/widgets.dart';

class MySlider extends StatelessWidget {
  final CarouselController controller;
  List<AnnoModel> myList;
  final bool showDots;
  final double viewportFraction;
  final bool enlargeCenterPage;
  final String sectionName;
  final double height;
  final double? width;
  MySlider(
      {Key? key,
      required this.controller,
      required this.myList,
      this.showDots = false,
      required this.viewportFraction,
      required this.enlargeCenterPage,
      required this.sectionName,
      required this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    myList =
        myList.length > 10 ? ScrapeData().getOnlyXItem(myList, 10) : myList;
    return Column(
      children: [
        CarouselSlider(
          items: myList.map((i) {
            return Builder(
                builder: (BuildContext context) => Container(
                      decoration: sectionName == 'announcements'
                          ? BoxDecoration(
                              color: UIParameters.isDarkMode(context)
                                  ? darkScaffoldTopColor
                                  : lightScaffoldTopColor,
                              borderRadius: BorderRadius.circular(20.0),
                            )
                          : null,
                      width: width,
                      child: InkWell(
                        onTap: () => launchURL(i.link!),
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: i.imgLink == null
                                    ? Container(
                                        alignment: Alignment.center,
                                        color: UIParameters.isDarkMode(context)
                                            ? darkScaffoldTopColor
                                            : lightScaffoldTopColor,
                                        child: Image(
                                          image: const AssetImage(
                                              "assets/img/uni_logo_white.png"),
                                          height: height / 2,
                                        ),
                                      )
                                    : Container(
                                        color: Colors.black.withOpacity(0.5),
                                        child: FadeInImage(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                          height: height,
                                          image: NetworkImage(i.imgLink!),
                                          placeholder: const AssetImage(
                                              "assets/img/uni_logo_white.png"),
                                          imageErrorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color: customTileColor(context)
                                                  .withOpacity(0.8),
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(Icons.error_outline),
                                                  Text(
                                                    'Görsel Yüklenemedi!',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )),
                                    padding: const EdgeInsets.only(left: 5),
                                    height: sectionName == 'announcements'
                                        ? height / 2
                                        : 30,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Center(
                                      child: Text(i.title!,
                                          style: TextStyle(
                                              fontSize: sectionName == 'news'
                                                  ? 15
                                                  : 14,
                                              color: Colors.white),
                                          maxLines:
                                              sectionName == 'announcements'
                                                  ? 3
                                                  : 1,
                                          overflow: TextOverflow.ellipsis),
                                    )))
                          ],
                        ),
                      ),
                    ));
          }).toList(),
          carouselController: controller,
          options: CarouselOptions(
            viewportFraction: viewportFraction,
            enlargeCenterPage: enlargeCenterPage,
            height: height,
            autoPlayCurve: Curves.decelerate,
            autoPlay: true,
            onPageChanged: (index, reason) {
              if (sectionName == 'news') {
                Provider.of<HomePageNotifier>(context, listen: false)
                    .setNewsImageIndex(index);
              } else {
                Provider.of<HomePageNotifier>(context, listen: false)
                    .setEventsImageIndex(index);
              }
            },
          ),
        ),
        if (showDots)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: myList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () {
                          controller.animateToPage(entry.key);
                          if (sectionName == 'news') {
                            Provider.of<HomePageNotifier>(context,
                                    listen: false)
                                .setNewsImageIndex(entry.key);
                          } else {
                            Provider.of<HomePageNotifier>(context,
                                    listen: false)
                                .setEventsImageIndex(entry.key);
                          }
                        },
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: sectionName == 'news'
                                ? UIParameters.isDarkMode(context)
                                    ? darkScaffoldTopColor.withOpacity(
                                        Provider.of<HomePageNotifier>(context)
                                                    .newsImageIndex ==
                                                entry.key
                                            ? 1
                                            : 0.4)
                                    : lightScaffoldTopColor.withOpacity(
                                        Provider.of<HomePageNotifier>(context)
                                                    .newsImageIndex ==
                                                entry.key
                                            ? 0.9
                                            : 0.4)
                                : UIParameters.isDarkMode(context)
                                    ? darkScaffoldTopColor.withOpacity(
                                        Provider.of<HomePageNotifier>(context)
                                                    .eventsImageIndex ==
                                                entry.key
                                            ? 0.9
                                            : 0.4)
                                    : lightScaffoldTopColor.withOpacity(
                                        Provider.of<HomePageNotifier>(context).eventsImageIndex == entry.key ? 0.9 : 0.4),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  CustomButton(
                    //title: 'Tümü',
                    color: UIParameters.isDarkMode(context)
                        ? darkScaffoldTopColor
                        : lightScaffoldTopColor,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: UIParameters.isDarkMode(context)
                          ? darkScaffoldTopColor
                          : lightScaffoldTopColor,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        CustomSlideRoute(
                            page: FuNewsEventAnno(
                                pageLink: fuNewsLink, pageTitle: 'Haberler'),
                            x: 0,
                            y: 1)),
                  ),
                ],
              ),
            ]),
          ),
      ],
    );
  }
}
