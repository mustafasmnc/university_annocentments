import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webscraping/core/view_model/widgets.dart';
import 'package:webscraping/pages/web_views_pdf.dart';
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
    return Scaffold(
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
                    onWebResourceError: (WebResourceError webviewerrr) {
                      errorMsg();
                    },
                    userAgent:
                        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36",
                    javascriptMode: JavascriptMode.unrestricted,
                    navigationDelegate: (NavigationRequest request) {
                      if (request.url.endsWith('.pdf')) {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyWebViewsPDF(
                                      myUrl: Uri.encodeFull(
                                          'https://docs.google.com/gview?embedded=true&url=${request.url}'),
                                    )));
                        //print('https://docs.google.com/gview?embedded=true&url=${request.url}');
                        return NavigationDecision.navigate;
                      }
                      return NavigationDecision.navigate;
                    },
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
              )
            : noInternetConn());
  }
}
