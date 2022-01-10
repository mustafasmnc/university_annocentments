import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webscraping/core/view_model/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViews extends StatefulWidget {
  String myUrl;
  MyWebViews({Key? key, required this.myUrl}) : super(key: key);

  @override
  State<MyWebViews> createState() => _MyWebViewsState();
}

class _MyWebViewsState extends State<MyWebViews> {
  bool loading = false;
  bool connectedInternet = false;
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    checkInternetConn();
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
            body: connectedInternet
                ? Stack(
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
                        initialUrl: widget.myUrl,
                      ),
                      loading ? Container() : circularLoader()
                    ],
                  )
                : noInternetConn())
      },
    );
  }
}
