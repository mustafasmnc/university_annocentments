import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateAppInitWidget extends StatefulWidget {
  Widget Function(RateMyApp) builder;

  RateAppInitWidget({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  _RateAppInitWidgetState createState() => _RateAppInitWidgetState();
}

class _RateAppInitWidgetState extends State<RateAppInitWidget> {
  RateMyApp? rateMyApp;

  static const playStoreId = 'funoti.smnc';
  static const appstoreId = 'com.apple.mobilesafari'; //change with app's appstore id

  @override
  Widget build(BuildContext context) => RateMyAppBuilder(
        rateMyApp: RateMyApp(
          googlePlayIdentifier: playStoreId,
          appStoreIdentifier: appstoreId,
          minDays: 1,
          minLaunches: 3,
          remindDays: 2,
          remindLaunches: 2,
        ),
        onInitialized: (context, rateMyApp) {
          setState(() => this.rateMyApp = rateMyApp);

          if (rateMyApp.shouldOpenDialog) {
            rateMyApp.showStarRateDialog(context,
                title: 'Uygulamayı beğendiniz mi?',
                message:
                    'Uygulamayı beğendiyseniz, bizi desteklemek için değerlendirebilirsiniz. Desteğiniz için teşekkürler!',
                //message:'Uygulamayı değerlendirerek diğer insanların uygulama hakkında bilgi edinmesini sağlayabilirsiniz. 1 dakikadan fazla sürmez',
                starRatingOptions:
                    const StarRatingOptions(initialRating: 5, minRating: 3),
                actionsBuilder: actionsBuilder);
          }
        },
        builder: (context) => rateMyApp == null
            ? const Center(child: CircularProgressIndicator())
            : widget.builder(rateMyApp!),
      );

  List<Widget> actionsBuilder(BuildContext context, double? stars) =>
      stars == null
          ? [buildCancelButton()]
          : [buildOkButton(stars), buildRemindButton(), buildCancelButton()];

  Widget buildOkButton(double stars) => TextButton(
        child:const  Text('DEĞERLENDİR'),
        onPressed: () async {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Değerlendirmeniz için teşekkürler!')),
          );

          final launchAppStore = stars >= 4;

          final event = RateMyAppEventType.rateButtonPressed;

          await rateMyApp!.callEvent(event);

          if (launchAppStore) {
            rateMyApp!.launchStore();
          }

          Navigator.of(context).pop();
        },
      );

  Widget buildRemindButton() => TextButton(
        child: Text('SONRA'),
        onPressed: () async {
          final event = RateMyAppEventType.laterButtonPressed;

          await rateMyApp!.callEvent(event);
          Navigator.of(context).pop();
        },
      );

  Widget buildCancelButton() => RateMyAppNoButton(
        rateMyApp!,
        text: 'İPTAL',
      );
}
