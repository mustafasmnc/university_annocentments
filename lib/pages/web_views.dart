import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MyWebViews extends StatefulWidget {
  String myUrl;
  MyWebViews({Key? key, required this.myUrl}) : super(key: key);

  @override
  State<MyWebViews> createState() => _MyWebViewsState();
}

class _MyWebViewsState extends State<MyWebViews> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        "/": (_) => new WebviewScaffold(
              url: widget.myUrl,
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
              initialChild: Center(
                child: CircularProgressIndicator(),
              ),
            ),
      },
    );
  }
}
