import 'dart:io';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:webscraping/core/data/my_department_database.dart';
import 'package:webscraping/core/data/scrape_data.dart';
import 'package:webscraping/core/notification_alarm/notification_service.dart';

class AlarmManagerService {
  Future<void> init() async {
    await MyDepartmentDatabase.initDB().then((value) async {
      await AndroidAlarmManager.initialize().then((value) {
        alarmManagerPeriodic();
      });
    });
  }

  displayNoti(String? title, String? body) {
    var notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    notifyHelper.displayNotification(
      title: title!,
      body: body!,
    );
  }
}

alarmManagerPeriodic() async {
  if (Platform.isAndroid) {
    await AndroidAlarmManager.periodic(
      const Duration(minutes: 60), //Do the same every 60 minutes
      0, //Different ID for each alarm
      scrapeCheckLastAnnoId,
      wakeup: true, //the device will be woken up when the alarm fires
      //startAt: DateTime(DateTime.now().year, DateTime.now().month,DateTime.now().day, 5, 0), //Start whit the specific time 5:00 am
      //rescheduleOnReboot: true, //Work after reboot
    );
  }
}

scrapeCheckLastAnnoId() {
  MyDepartmentDatabase.getMyDepartment().then((myDepartmentValue) {
    if (myDepartmentValue.isNotEmpty || myDepartmentValue != '') {
      String myDepartmentCode =
          myDepartmentValue[0]['myDepartmentCode'].toString();
      print('myDepartmentCode: $myDepartmentCode');
      ScrapeData()
          .lastAnnoIdScraping(myDepartmentCode)
          .then((scrapedLastAnnoIdValue) {
        MyDepartmentDatabase.getLastAnnoId().then((lastAnnoIdValue) async {
          if (scrapedLastAnnoIdValue != lastAnnoIdValue[0]['lastAnnoId']) {
            AlarmManagerService().displayNoti("Yeni Duyuru Yayınlandı!",
                myDepartmentValue[0]['myDepartmentName'].toString());
            MyDepartmentDatabase.updateLastAnnoId(scrapedLastAnnoIdValue);
          }
        });
      });
    }
  });

  alarmManagerPeriodic();
}
