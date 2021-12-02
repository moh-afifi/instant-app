import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskLogic extends ChangeNotifier{
  Database _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDB();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> initializeDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'Task.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Notes (id INTEGER PRIMARY KEY, date TEXT, note TEXT)');
    });
    return database;
  }

  insertData(String date, String note) async {
    var dbClient = await db;
    dbClient.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO Notes (date,note) VALUES (?,?)',
        [date, note],
      );
    });
  }

  List dataList=[];

  getData() async {
    var dbClient = await db;
    dataList = await dbClient.rawQuery('SELECT * FROM Notes');
    print(dataList);
    notifyListeners();
  }


  deleteData(int id)async{
    var dbClient= await db;
    await dbClient.rawDelete('DELETE FROM Notes WHERE id=?', [id]);
  }

}
