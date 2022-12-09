import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../theme/app_colors.dart';
import '../../theme/ui_parameters.dart';

Widget noInternetConn({double myIconSize = 40, double myFontSize = 20}) =>
    SizedBox(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
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

Container circularLoader(BuildContext context) {
  return Container(
      decoration: BoxDecoration(
        color: UIParameters.isDarkMode(context)
            ? darkScaffolBackgroundColor.withOpacity(0.4)
            : lightScaffolBackgroundColor.withOpacity(0.4),
      ),
      child: const Center(child: CircularProgressIndicator()));
}

Text contactText(
    {String? text,
    double? fontSize,
    FontWeight? fontWeight,
    double letterSpacing = 1}) {
  return Text(text!,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ));
}

Widget errorMsg({String errorTitle = 'Bir Sorun Oluştu. Tekrar Deneyiniz.'}) =>
    SizedBox(
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 40,
          ),
          const SizedBox(height: 10),
          Text(
            errorTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      )),
    );

launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
