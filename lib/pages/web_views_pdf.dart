import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webscraping/core/view_model/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewsPDF extends StatefulWidget {
  String myUrl;
  MyWebViewsPDF({Key? key, required this.myUrl}) : super(key: key);

  @override
  State<MyWebViewsPDF> createState() => _MyWebViewsPDFState();
}

class _MyWebViewsPDFState extends State<MyWebViewsPDF> {
  bool loading = false;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (_) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 40,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Stack(
              children: [
                WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  onProgress: (int progress) {
                    //print('WebView is loading (progress : $progress%)');
                    if (progress == 100) {
                      setState(() {
                        loading = true;
                      });
                    } else {
                      setState(() {
                        loading = false;
                      });
                    }
                  },
                  initialUrl: Uri.encodeFull(widget.myUrl),
                ),
                loading ? Container() : circularLoader()
              ],
            ))
      },
    );
  }
}
