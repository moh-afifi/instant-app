import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
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
    String path = join(databasesPath, 'Sales.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Emp (id INTEGER PRIMARY KEY, name TEXT, phone TEXT, address TEXT,age INTEGER)');
    });
    return database;
  }

  insertData(String name, String phone, String address, int age) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO Emp(name, phone, address,age) VALUES(?, ?, ?,?)',
          [name, phone, address, age]);
      print('$id *************************');
    });
  }

  getData() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM Emp');
    for (int i = 0; i < list.length; i++) {
      String name = list[i]['name'];
      print(name);
    }
    // print(list);
  }

  getSingleData() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery('SELECT * FROM Emp where id=?', [1]);
    print(result);
  }

  Future<int> updateData(
      String name, String phone, String address, int age, int id) async {
    var dbClient = await db;
    var result = await dbClient.rawUpdate(
        'UPDATE Emp SET name=? , phone=? , address=?,age= ? WHERE id=?',
        [name, phone, address, age, id]);
    return result;
    print('$result **********************');
  }

  Future<int> deleteData() async {
    var dbClient = await db;
    int count = await dbClient.rawDelete('DELETE FROM Emp WHERE id=?', [3]);
    print('$count ***********************');
    return count;
  }

  deleteAllData() async{
    var dbClient = await db;
    await dbClient.delete('Emp');
  }
}
