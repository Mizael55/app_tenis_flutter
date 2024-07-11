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

  Future<AddCanchasModel> newCancha(AddCanchasModel valor) async {
    final id = await DBProvider.db.newCancha(valor);
    // Asignar el ID de la base de datos al modelo
    valor.id = id;
    canchasRentered.add(valor);
    notifyListeners();
    return valor;
  }

  loadAllCanchaRentered() async {
    final canchas = await DBProvider.db.getAllCanchasRentered();
    canchasRentered = [...canchas];
    notifyListeners();
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
