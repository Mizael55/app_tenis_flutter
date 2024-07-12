import 'package:flutter/material.dart';
import '../db/db.dart';
import '../models/models.dart';

class UserProvider extends ChangeNotifier {
  String userName = '';

  String get getUser => userName;

  set setUser(String name) {
    userName = name;
    notifyListeners();
  }

  Future<UserModel> createUser(UserModel user) async {
    final db = await DBProvider.db.newUser(user);
    user.id = db;
    notifyListeners();
    // print(user);
    return user;
  }

  Future<UserModel?> loadUser(String email, String password) async {
    final user = await DBProvider.db.getUser(email, password);
    if (user != null) {
      userName = user.name;
      notifyListeners();
      return user;
    }
    return null;
  }
}
