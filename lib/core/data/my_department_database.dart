// import 'package:sqflite/sqflite.dart';

// class MyDepartmentDatabase {
//   static Database? _db;
//   static final int _version = 1;
//   static final String _myDepartmentTableName = "myDepartment";
//   static final String _lastAnnoIdTableName = "lastAnno";

//   static Future<void> initDB() async {
//     if (_db != null) {
//       return;
//     }

//     try {
//       String _path = await getDatabasesPath() + 'departments.db';
//       _db =
//           await openDatabase(_path, version: _version, onCreate: (db, version) {
//         print("creating a new one");
//         db.execute(
//           "CREATE TABLE $_myDepartmentTableName("
//           "id INTEGER PRIMARY KEY AUTOINCREMENT, "
//           "myDepartmentName STRING,"
//           "myDepartmentCode STRING )",
//         );
//         db.execute(
//           "CREATE TABLE $_lastAnnoIdTableName("
//           "id INTEGER PRIMARY KEY AUTOINCREMENT, "
//           "lastAnnoId INTEGER )",
//         );
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   static Future<int> insertLastAnnoId(int lastAnnoId) async {
//     int id = await _db!.rawInsert(
//         'INSERT INTO $_lastAnnoIdTableName(lastAnnoId) VALUES(?)',
//         [lastAnnoId]);
//     return id;
//   }

//   static updateLastAnnoId(int lastAnnoId) async {
//     int update = await _db!.rawUpdate(
//         'UPDATE $_lastAnnoIdTableName SET lastAnnoId = ?', [lastAnnoId]);
//     if (update == 0) {
//       insertLastAnnoId(lastAnnoId);
//     }
//   }

//   static Future getLastAnnoId() async {
//     List<Map> annoId =
//         await _db!.rawQuery('SELECT * FROM $_lastAnnoIdTableName');
//     return annoId;
//   }

//   static deleteLastAnnoId() async {
//     await _db!.rawDelete('DELETE FROM $_lastAnnoIdTableName');
//   }

//   static Future<int> insertmyDepartment(
//       String myDepartmentCode, String myDepartmentName) async {
//     //return await _db?.insert(_myDepartmentTableName, task!.toJson()) ?? 1;
//     int id = await _db!.rawInsert(
//         'INSERT INTO $_myDepartmentTableName(myDepartmentCode,myDepartmentName) VALUES(?,?)',
//         [myDepartmentCode, myDepartmentName]);
//     return id;
//   }

//   static updateMyDepartment(
//       {int id = 1, String? myDepartmentCode, String? myDepartmentName}) async {
//     int update = await _db!.rawUpdate(
//         'UPDATE $_myDepartmentTableName SET myDepartmentCode = ?, myDepartmentName=?',
//         [myDepartmentCode, myDepartmentName]);
//     if (update == 0) {
//       insertmyDepartment(myDepartmentCode!, myDepartmentName!);
//     }
//   }

//   static Future getMyDepartment() async {
//     initDB();
//     List<Map> depCode = await _db!.rawQuery(
//         'SELECT * FROM $_myDepartmentTableName WHERE id = (SELECT MAX(id)  FROM $_myDepartmentTableName)');
//     return depCode;
//   }

//   static deleteMyDepartment() async {
//     await _db!.rawDelete('DELETE FROM $_myDepartmentTableName');
//   }
// }
