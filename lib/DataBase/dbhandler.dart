// ignore_for_file: constant_identifier_names, prefer_is_empty

import 'package:sec2/DataBase/cousres.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHandler {
  static Database? _db;
  static const String DATABASE = "mydata.db";
  static const int VERSION = 1;
  static const String TABLE_STUDENTS = "students";
  static const String ID = "id";
  static const String TiTLE = "title";
  static const String DESC = "DESC";

  Future<Database> get db async {
    if (_db == null) {
      // OPEN CONNECTION
      String path = join(await getDatabasesPath(), DATABASE);
      _db = await openDatabase(path,
          version: VERSION, onCreate: _onCreate, onUpgrade: _onUpgrade);
    }
    return _db!;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE_STUDENTS ($ID INTEGER PRIMARY KEY AUTOINCREMENT, $TiTLE TEXT, $DESC TEXT)");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("drop table $TABLE_STUDENTS");
    await _onCreate(db, newVersion);
  }

  Future<Cousres> save(Cousres cousres) async {
    Database dbClient = await db;
    int id = await dbClient.insert(TABLE_STUDENTS,
        {'id': cousres.id, 'title': cousres.title, 'desc': cousres.desc});
    cousres.id = id;
    return cousres;
  }

  Future<List<Cousres>> getCourse() async {
    Cousres cousre = Cousres();
    Database dbClient = await db;
    List<Map> maps =
        await dbClient.query(TABLE_STUDENTS, columns: [ID, TiTLE, DESC]);

    List<Cousres> cousres = [];
    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        Map map = maps[i];
        Cousres cousre =
            Cousres(id: map[ID], title: map[TiTLE], desc: map[DESC]);
        cousres.add(cousre);
      }
    }
    if (maps.isEmpty) {
      cousre.id = 0;
    }
    return cousres;
  }

  Future<int> delete(int id) async {
    Database dbClient = await db;
    int numOfRecords = await dbClient
        .delete(TABLE_STUDENTS, where: '$ID = ?', whereArgs: [id]);
    return numOfRecords;
  }
}
