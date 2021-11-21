import 'package:flutter/material.dart';
import 'package:webscraping/pages/web_views.dart';

class Announcements extends StatefulWidget {
  final id;
  final title;
  final link;
  Announcements(
      {Key? key, required this.id, required this.title, required this.link})
      : super(key: key);

  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Card(
          elevation: 5,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: Text(
              widget.title.replaceAll('\n', ''),
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyWebViews(myUrl: widget.link))));
  }
}
