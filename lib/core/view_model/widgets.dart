import 'package:flutter/material.dart';

Widget noInternetConn({double myIconSize = 40, double myFontSize = 20}) =>
    Container(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: myIconSize,
          ),
          Text(
            'İnternet Bağlantınızı Kontrol Ediniz',
            style: TextStyle(fontSize: myFontSize),
          ),
        ],
      )),
    );

Widget errorMsg({String errorTitle = 'Bir Sorun Oluştu. Tekrar Deneyiniz.'}) =>
    Container(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 40,
          ),
          Text(
            errorTitle,
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
    );

Container circularLoader() {
  return Container(
      decoration: BoxDecoration(
        color: Colors.black38,
      ),
      child: Center(child: CircularProgressIndicator()));
}
