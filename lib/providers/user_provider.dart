import 'package:flutter/material.dart';
import '../db/db.dart';
import '../models/models.dart';

class UserProvider extends ChangeNotifier {
  // Asumiendo que 'user' es tu objeto UserModel
  String? userDetails;

  String get user => userDetails!;

  Future<UserModel> createUser(UserModel user) async {
    final db = await DBProvider.db.newUser(user);
    user.id = db;
    notifyListeners();
    return user;
  }

  Future<UserModel?> loadUser(String email, String password) async {
    final user = await DBProvider.db.getUser(email, password);
    if (user != null) {
      userDetails = user.name;
      notifyListeners();
      return user;
    }
    return null;
  }
}
