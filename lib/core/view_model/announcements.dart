import 'package:flutter/material.dart';
import 'package:webscraping/core/theme/app_colors.dart';
import 'package:webscraping/core/view_model/widgets/widgets.dart';

class Announcements extends StatefulWidget {
  final int? id;
  final String? title;
  final String? day;
  final String? month;
  final String? link;
  const Announcements(
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
            color: customTileColor(context),
            height: 70,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:const  BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Container(
                      decoration:const  BoxDecoration(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.month!,
                            textAlign: TextAlign.center,
                            style:const  TextStyle(color: Colors.white),
                          ),
                          Container(height: 1, color: Colors.white),
                          Text(
                            widget.day!,
                            textAlign: TextAlign.center,
                            style:const  TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ],
                      )),
                ),
                //SizedBox(width: 5),
                Expanded(
                  child: Container(
                    padding:const  EdgeInsets.only(left: 5),
                    child: Text(
                      widget.title!,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:const  TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () => launchURL(widget.link!));
  }
}
