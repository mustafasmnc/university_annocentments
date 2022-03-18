import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webscraping/core/data/my_department_database.dart';
import 'package:webscraping/core/model/rate_app_init_widget.dart';
import 'package:webscraping/core/notification_alarm/alarm_manager_service.dart';
import 'package:webscraping/core/theme/theme_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/pages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeService.init();
  //await MyDepartmentDatabase.initDB();
  //await AlarmManagerService().init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CustomThemeDataModal(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fırat Üniversitesi Duyurular',
      theme: Provider.of<CustomThemeDataModal>(context).getThemeData,
      home: RateAppInitWidget(
        builder: (rateMyApp) => MainPage(
          rateMyApp: rateMyApp,
        ),
      ),
    );
  }
}
