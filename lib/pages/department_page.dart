import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webscraping/core/data/my_department_database.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/notification_alarm/alarm_manager_service.dart';
import 'package:webscraping/core/notification_alarm/notification_service.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/core/view_model/announcements.dart';
import 'package:webscraping/core/view_model/news_event_anno.dart';
import 'package:webscraping/core/view_model/widgets.dart';

class DepartmentPage extends StatefulWidget {
  String? depNewsAnno;
  String? facultyName;
  String? departmentName;
  String? departmentCode;
  DepartmentPage({
    Key? key,
    this.departmentName,
    this.facultyName,
    required this.departmentCode,
    this.depNewsAnno,
  }) : super(key: key);

  @override
  _DepartmentPageState createState() => _DepartmentPageState();
}

class _DepartmentPageState extends State<DepartmentPage> {
  late Future getData;
  int page = 1;
  bool loading = false;
  bool checkbox = false;
  bool connectedInternet = false;

  @override
  void initState() {
    checkInternetConn();
    if (widget.depNewsAnno == 'duyurular') {
      announcements.clear();
      getData = ScrapeData().getDepAnno(code: widget.departmentCode!, page: 1);
    }
    if (widget.depNewsAnno == 'haberler') {
      news.clear();
      getData = ScrapeData().getDepNews(code: widget.departmentCode!, page: 1);
    }
    // MyDepartmentDatabase.getMyDepartment().then((value) {
    //   if (value.isNotEmpty) {
    //     if (widget.departmentCode == value[0]['myDepartmentCode'].toString()) {
    //       setState(() {
    //         checkbox = true;
    //       });
    //     }
    //   } else {
    //     MyDepartmentDatabase.updateLastAnnoId(0);
    //   }
    // });
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
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   iconTheme: IconThemeData(
        //       color: ThemeService.instance.isDarkMode()
        //           ? Colors.white
        //           : Colors.black),
        //   centerTitle: true,
        //   title: Column(
        //     children: [
        //       // Text(
        //       //   widget.facultyName.toString(),
        //       //   style: TextStyle(
        //       //       fontSize: 13,
        //       //       color: ThemeService.instance.isDarkMode()
        //       //           ? Colors.white
        //       //           : Colors.black87),
        //       // ),
        //       Text(
        //         widget.departmentName.toString(),
        //         style: TextStyle(
        //             fontSize: 15,
        //             color: ThemeService.instance.isDarkMode()
        //                 ? Colors.white
        //                 : Colors.black87),
        //       ),
        //       Text('DUYURULAR',
        //           style: TextStyle(
        //               fontSize: 17,
        //               color: ThemeService.instance.isDarkMode()
        //                   ? Colors.white
        //                   : Colors.black87)),
        //     ],
        //   ),
        //   // actions: [
        //   //   Padding(
        //   //     padding: const EdgeInsets.only(right: 5),
        //   //     child: Column(
        //   //       mainAxisAlignment: MainAxisAlignment.center,
        //   //       children: [
        //   //         Text("Bildirim",
        //   //             style: TextStyle(
        //   //                 fontSize: 15,
        //   //                 color: ThemeService.instance.isDarkMode()
        //   //                     ? Colors.white
        //   //                     : Colors.black87)),
        //   //         SizedBox(height: 5),
        //   //         SizedBox(
        //   //           height: 20,
        //   //           width: 20,
        //   //           child: Checkbox(
        //   //             checkColor: Colors.white,
        //   //             value: checkbox,
        //   //             onChanged: (bool? value) async {
        //   //               updateMyDepartment();
        //   //               //updateLastAnnoId();
        //   //               AlarmManagerService().init();
        //   //               setState(() {
        //   //                 checkbox = value!;
        //   //               });
        //   //             },
        //   //           ),
        //   //         )
        //   //       ],
        //   //     ),
        //   //   )
        //   // ],
        //   flexibleSpace: Image.asset(
        //     ThemeService.instance.isDarkMode()
        //         ? "assets/img/footer-bg.png"
        //         : "assets/img/bg-pattern.png",
        //     width: MediaQuery.of(context).size.width,
        //     fit: BoxFit.cover,
        //   ),
        //   backgroundColor: Colors.transparent,
        // ),
        backgroundColor: ThemeService.instance.isDarkMode()
            ? Color(0xFF292D32)
            : Colors.grey[300],
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     //MyDepartmentDatabase.deleteMyDepartment();
        //     // MyDepartmentDatabase.getMyDepartment().then((value) {
        //     //   if (value != '' || value.isNotEmpty) {
        //     //     print(
        //     //         "${value[0]['myDepartmentCode'].toString()} + ${value[0]['myDepartmentName'].toString()} + ${value[0]['id'].toString()}");
        //     //   } else
        //     //     print('mydepartmentbossss');
        //     // });
        //     //ScrapeData().lastAnnoIdScraping(widget.departmentCode!).then((value) => print(value));
        //     //MyDepartmentDatabase.getLastAnnoId().then((value) => print(value));

        //     // notifyHelper.displayNotification(
        //     //   title: "Yeni Duyuru Yayınlandı!",
        //     //   body: widget.departmentName,
        //     // );
        //   },
        // ),
        body: connectedInternet
            ? Stack(
                children: [
                  FutureBuilder(
                      future: getData,
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return circularLoader();
                        else if (snapshot.hasError) {
                          print(snapshot.error);
                          return Center(child: errorMsg());
                        } else if (announcements.length < 1 &&
                            news.length < 1) {
                          return Center(
                              child: errorMsg(
                                  errorTitle:
                                      'Bu bölüm için duyuru bulunamadı.\nFakülte duyurularını kontrol ediniz.'));
                        } else if (snapshot.hasData) {
                          return ListView(
                            children: [
                              ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: widget.depNewsAnno == 'duyurular'
                                      ? announcements.length
                                      : news.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var id = widget.depNewsAnno == 'duyurular'
                                        ? announcements[index].id
                                        : news[index].id;
                                    var title =
                                        widget.depNewsAnno == 'duyurular'
                                            ? announcements[index].title
                                            : news[index].title;
                                    var desc = widget.depNewsAnno == 'duyurular'
                                        ? ''
                                        : news[index].desc;
                                    var day = widget.depNewsAnno == 'duyurular'
                                        ? announcements[index].day
                                        : news[index].day;
                                    var month =
                                        widget.depNewsAnno == 'duyurular'
                                            ? announcements[index].month
                                            : news[index].month;
                                    var link = widget.depNewsAnno == 'duyurular'
                                        ? announcements[index].link
                                        : news[index].link;
                                    var img = widget.depNewsAnno == 'duyurular'
                                        ? ''
                                        : news[index].imgLink;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: widget.depNewsAnno == 'duyurular'
                                          ? Announcements(
                                              id: id,
                                              title: title,
                                              day: day,
                                              month: month,
                                              link: link,
                                            )
                                          : NewsEventAnno(
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
                                    if (widget.depNewsAnno == 'duyurular') {
                                      await ScrapeData()
                                          .getDepAnno(
                                              code: widget.departmentCode!,
                                              page: page)
                                          .then((value) {
                                        setState(() {
                                          loading = false;
                                        });
                                      });
                                    }
                                    if (widget.depNewsAnno == 'haberler') {
                                      await ScrapeData()
                                          .getDepNews(
                                              code: widget.departmentCode!,
                                              page: page)
                                          .then((value) {
                                        setState(() {
                                          loading = false;
                                        });
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/img/title-bg.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Text(
                                      "Daha Fazla Duyuru",
                                      style: TextStyle(
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
                          return circularLoader();
                        }
                      }),
                  loading ? circularLoader() : Container()
                ],
              )
            : noInternetConn(),
      ),
    );
  }

  // void updateLastAnnoId() {
  //   ScrapeData().lastAnnoIdScraping(widget.departmentCode!).then((value) {
  //     MyDepartmentDatabase.updateLastAnnoId(value);
  //   });
  // }

  // Future<int> updateMyDepartment() {
  //   // MyDepartmentDatabase.updateMyDepartment(
  //   //     myDepartmentCode: widget.departmentCode!,
  //   //     myDepartmentName: widget.departmentName);
  //   Future<int> departmentID = MyDepartmentDatabase.insertmyDepartment(
  //       widget.departmentCode!, widget.departmentName!);
  //   return departmentID;
  // }
  // updateMyDepartment() {
  //   MyDepartmentDatabase.updateMyDepartment(
  //       myDepartmentCode: widget.departmentCode!,
  //       myDepartmentName: widget.departmentName);
  // }
}
