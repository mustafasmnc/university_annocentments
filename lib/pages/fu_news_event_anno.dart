import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/view_model/news_event_anno.dart';
import 'package:webscraping/core/view_model/widgets/widgets.dart';

import '../core/view_model/widgets/top_background.dart';

class FuNewsEventAnno extends StatefulWidget {
  final String? pageTitle;
  final String? pageLink;
  const FuNewsEventAnno({Key? key, this.pageTitle, this.pageLink}) : super(key: key);

  @override
  _FuNewsEventAnnoState createState() => _FuNewsEventAnnoState();
}

class _FuNewsEventAnnoState extends State<FuNewsEventAnno> {
  late Future getData;
  int page = 1;
  bool loading = false;
  bool connectedInternet = false;

  @override
  void initState() {
    checkInternetConn();
    widget.pageTitle == 'Haberler'
        ? fuNewsList.clear()
        : widget.pageTitle == 'Duyurular'
            ? fuAnnoList.clear()
            : fuEventList.clear();
    super.initState();
    getData =
        ScrapeData().getFuNewsEventAnno(restLink: widget.pageLink!, page: 1);
  }

  checkInternetConn() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          connectedInternet = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        connectedInternet = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: connectedInternet
          ? Stack(
              children: [
                Column(
                  children: [
                    TopBackground(
                      height: 90,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10)
                            .copyWith(top: 20),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: const Icon(Icons.arrow_back_ios_new)),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  widget.pageTitle.toString(),
                                  style: const TextStyle(fontSize: 18),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                          future: getData,
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height - 90,
                                  child:
                                      Center(child: circularLoader(context)));
                            } else if (snapshot.hasError) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height - 90,
                                child: Center(
                                    child: errorMsg(
                                        errorTitle: 'Öğün Bulunamadı')),
                              );
                            } else if (snapshot.hasData) {
                              return ListView(
                                children: [
                                  ListView.builder(
                                      physics:const  ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: widget.pageTitle == 'Haberler'
                                          ? fuNewsList.length
                                          : widget.pageTitle == 'Duyurular'
                                              ? fuAnnoList.length
                                              : fuEventList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var id,
                                            title,
                                            desc,
                                            img,
                                            day,
                                            month,
                                            link;
                                        title = widget.pageTitle == 'Haberler'
                                            ? fuNewsList[index].title
                                            : widget.pageTitle == 'Duyurular'
                                                ? fuAnnoList[index].title
                                                : fuEventList[index].title;
                                        desc = widget.pageTitle == 'Haberler'
                                            ? fuNewsList[index].desc
                                            : widget.pageTitle == 'Duyurular'
                                                ? fuAnnoList[index].desc
                                                : fuEventList[index].desc;
                                        img = widget.pageTitle == 'Haberler'
                                            ? fuNewsList[index].imgLink
                                            : widget.pageTitle == 'Duyurular'
                                                ? fuAnnoList[index].imgLink
                                                : fuEventList[index].imgLink;
                                        day = widget.pageTitle == 'Haberler'
                                            ? fuNewsList[index].day
                                            : widget.pageTitle == 'Duyurular'
                                                ? fuAnnoList[index].day
                                                : fuEventList[index].day;
                                        month = widget.pageTitle == 'Haberler'
                                            ? fuNewsList[index].month
                                            : widget.pageTitle == 'Duyurular'
                                                ? fuAnnoList[index].month
                                                : fuEventList[index].month;
                                        link = widget.pageTitle == 'Haberler'
                                            ? fuNewsList[index].link
                                            : widget.pageTitle == 'Duyurular'
                                                ? fuAnnoList[index].link
                                                : fuEventList[index].link;
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          child: NewsEventAnno(
                                            title: title,
                                            desc: desc,
                                            imgLink: img,
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
                                            .getFuNewsEventAnno(
                                                restLink: widget.pageLink!,
                                                page: page)
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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image:const  DecorationImage(
                                            image: AssetImage(
                                                "assets/img/title-bg.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Text(
                                          "Daha Fazla ${widget.pageTitle}",
                                          style:const  TextStyle(
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
                              return circularLoader(context);
                            }
                          }),
                    ),
                  ],
                ),
                loading ? circularLoader(context) : Container()
              ],
            )
          : noInternetConn(),
    );
  }
}
