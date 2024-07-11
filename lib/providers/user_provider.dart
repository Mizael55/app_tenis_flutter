import 'package:flutter/material.dart';
import '../db/db.dart';
import '../models/models.dart';

class UserProvider extends ChangeNotifier {

  Future<UserModel> createUser(UserModel user) async {
    final db = await DBProvider.db.newUser(user);
    user.id = db;
    notifyListeners();
    return user;
  }

  Future<UserModel> loadUser(String email, String password) async {
    final user = await DBProvider.db.getUser(email, password);
    notifyListeners();
    return user;
  }
}
