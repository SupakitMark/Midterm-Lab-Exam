import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'attendance.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE attendance(id INTEGER PRIMARY KEY AUTOINCREMENT, prevTopic TEXT, expectedTopic TEXT, mood INTEGER, learnedToday TEXT, feedback TEXT, timestamp TEXT, gps TEXT, qrCode TEXT)"
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(Map<String, dynamic> data) async {
    final db = await DBHelper.database();
    await db.insert('attendance', data,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await DBHelper.database();
    return db.query('attendance');
  }
}
