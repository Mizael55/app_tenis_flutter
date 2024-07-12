import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../db/db.dart';
import '../models/models.dart';

class CanchasProvider extends ChangeNotifier {
  final List<CanchasModels> _canchas = [];
  List<AddCanchasModel> canchasRentered = [];

  get canchas => _canchas;
  get canchasRenteredList => canchasRentered;

  Future<int> newCancha(AddCanchasModel newCancha, String date,
      String startTime, String endTime, String canchaType) async {
    final id = await DBProvider.db
        .newCancha(newCancha, date, startTime, endTime, canchaType);
    // Asignar el ID de la base de datos al modelo
    newCancha.id = id;
    canchasRentered.add(newCancha);
    await loadAllCanchaRentered();
    return id;
  }

  loadAllCanchaRentered() async {
    final canchas = await DBProvider.db.getAllCanchasRentered();
    canchas.sort((a, b) => a.date.compareTo(b.date));
    canchasRentered = [...canchas];
    notifyListeners();
  }

  deleteCancha(int id) async {
    await DBProvider.db.deleteCancha(id);
    loadAllCanchaRentered();
  }

  getCanchasJson() async {
    final response = await rootBundle.loadString('assets/img/canchas.json');
    final data = json.decode(response);
    _canchas.clear();
    data.forEach((cancha) {
      final canchaTemp = CanchasModels.fromJson(cancha);
      _canchas.add(canchaTemp);
    });
    notifyListeners();
  }
}
