import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webscraping/core/theme/theme_data.dart';
import 'package:webscraping/core/theme/theme_service.dart';
import 'package:webscraping/pages/splash_page.dart';

import 'core/controller/home_page_controller.dart';

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
      ChangeNotifierProvider(
        create: (context) => HomePageNotifier(),
      ),
    ],
    child:const MyApp(),
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
      home: SplashPage(),
    );
  }
}
