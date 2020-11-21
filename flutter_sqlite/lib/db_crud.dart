import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath(); // getDatabasesPath()는 경로값을 리턴합니다
    return sql.openDatabase(path.join(dbPath, 'friend.db'), // join() 메서드는 경로와 생성할 DB 파일의 이름을 매개변수로 받아 데이터베이스를 생성합니다
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE friend(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)');
    }, version: 1);
  }
  
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database(); // DBHelper 클래스의 database() 메서드를 실행합니다
    db.insert(
      'friend', // 추가할 테이블 명
      data, // 저장할 데이터, Map 형식으로 추가됩니다
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }
  
  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }
  
  static Future<void> deleteData(String table, String id) async {
    final db = await DBHelper.database(); 

    await db.delete( // delete() 메서드를 실행합니다
      table, // 값을 제거할 테이블을 지정합니다
      where: "id = ?", // id 값을 사용자로부터 입력받아 지정한 id 값의 행을 제거합니다
      whereArgs: [id],
    );
  }
  
  static Future<void> updateData(String table, Map<String, Object> data, String id) async {
    final db = await DBHelper.database();

    await db.update(
      table,
      data,
      where: "id = ?",
      whereArgs: [id],
    );
  }  
}