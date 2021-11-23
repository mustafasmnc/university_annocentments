import 'package:flutter/material.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/pages/web_views.dart';

class Announcements extends StatefulWidget {
  final id;
  final title;
  final day;
  final month;
  final link;
  Announcements(
      {Key? key,
      required this.id,
      required this.title,
      required this.link,
      this.day,
      this.month})
      : super(key: key);

  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ThemeService.instance.isDarkMode()
                    ? "assets/img/footer-bg.png"
                    : "assets/img/bg-pattern.png"),
                fit: BoxFit.cover,
              ),
            ),
            height: 70,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/img/title-bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.center,
                      height: 70,
                      width: 60,
                      //color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.month,
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(height: 1, color: Colors.white),
                          Text(
                            widget.day,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      )),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyWebViews(myUrl: widget.link))));
  }
}
