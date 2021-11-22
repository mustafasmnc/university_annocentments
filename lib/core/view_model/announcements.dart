import 'package:flutter/material.dart';
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
        // child: Card(
        //   elevation: 5,
        //   child: Padding(
        //     padding:
        //         const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        //     child: Row(
        //       children: [
        //         Text("${widget.month}/${widget.day}"),SizedBox(width: 5),
        //         Expanded(
        //           child: Text(
        //             widget.title,
        //             style: TextStyle(fontSize: 17),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/footer-bg.png"),
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
                          Text(widget.month),
                          Container(
                            height: 1,
                            color: Colors.white,
                          ),
                          Text(
                            widget.day,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
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
