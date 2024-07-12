import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/models.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDB();
    return _database;
  }

  initDB() async {
    // path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'tennis.db');
    print(path);

    // Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Tennis(
            id INTEGER PRIMARY KEY,
            title TEXT,
            type TEXT,
            image TEXT,
            price TEXT,
            starthour TEXT,
            endhour TEXT,
            date TEXT,
            comment TEXT,
            renter TEXT,
            instructor TEXT,
            horas TEXT,
            weather TEXT,
            created_at TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE User(
            id INTEGER PRIMARY KEY,
            name TEXT,
            email TEXT,
            telephone TEXT,
            password TEXT,
            confirmPassword TEXT
          )
        ''');
      },
    );
  }

  Future<int> newUser(UserModel newUser) async {
    final db = await database;
    final res = await db!.insert('User', newUser.toJson());
    // print(res);
    // Es el ID del último registro insertado
    return res;
  }

  // get user by email and password
  Future getUser(String email, String password) async {
    final db = await database;
    final res = await db!.query('User',
        where: 'email = ? and password = ?', whereArgs: [email, password]);
    return res.isNotEmpty ? UserModel.fromJson(res.first) : null;
  }

  Future<int> newCancha(AddCanchasModel newCancha) async {
    final db = await database;
    final res = await db!.insert('Tennis', newCancha.toJson());
    // print(res);
    // Es el ID del último registro insertado
    return res;
  }

  Future<List<AddCanchasModel>> getAllCanchasRentered() async {
    final db = await database;
    final res = await db!.query('Tennis');
    return res.isNotEmpty
        ? res.map((s) => AddCanchasModel.fromJson(s)).toList()
        : [];
  }

  Future<int> deleteCancha(int id) async {
    final db = await database;
    final res = await db!.delete('Tennis', where: 'id = ?', whereArgs: [id]);
    return res;
  }
}
