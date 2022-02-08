import 'package:flutter/material.dart';

Widget noInternetConn() => Container(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            size: 40,
          ),
          Text(
            'İnternet Bağlantınızı Kontrol Ediniz',
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
    );

    Widget errorMsg() => Container(
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
            'Bir Sorun Oluştu. Tekrar Deneyiniz.',
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
