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
      version: 2,
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
            created_at TEXT,
            canchaType TEXT
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

  Future<int> newCancha(AddCanchasModel newCancha, String date, String starthour, String endhour, String canchaType) async {
  final db = await database;

  // Verificar que el tipo de cancha sea A, B, o C
  if (!['A', 'B', 'C'].contains(canchaType)) {
    return 0;
    // return 'Tipo de cancha inválido';
  }

  // Contar cuántas reservas existen para la fecha y tipo de cancha dados
  final resCount = await db!.rawQuery(
      'SELECT COUNT(*) as count FROM Tennis WHERE date = ? AND canchaType = ?',
      [date, canchaType]);

  // Asegúrate de que 'count' no sea null antes de hacer la comparación.
  if (resCount.isNotEmpty) {
    final count = int.tryParse(resCount.first['count'].toString()) ?? 0;
    if (count >= 3) {
      return 1;
      // return 'Se ha alcanzado el máximo de reservas por día para el tipo de cancha $canchaType';
    }
  }

  // Verificar si ya existe una reserva para la misma fecha, hora de inicio, hora de fin y tipo de cancha
  final existingReserve = await db.query(
    'Tennis',
    where: 'date = ? AND ((starthour <= ? AND endhour > ?) OR (starthour < ? AND endhour >= ?)) AND canchaType = ?',
    whereArgs: [date, starthour, starthour, endhour, endhour, canchaType],
  );

  if (existingReserve.isNotEmpty) {
    // return 'Ya existe una reserva para la fecha y rango de horas seleccionados con el tipo de cancha';
    return 2;
  }

  // Proceder a insertar la nueva reserva
  final id = await db.insert('Tennis', newCancha.toJson());
  // return 'Reserva realizada con éxito para la cancha tipo $canchaType, ID: $id';
  return id;
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
