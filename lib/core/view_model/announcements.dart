import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            //Text(widget.id.toString()),
            Text(widget.title.toString()),
            Text(
              widget.link.toString(),
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
