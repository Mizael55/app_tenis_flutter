import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/models.dart';

class CanchasProvider extends ChangeNotifier {
  final List<CanchasModels> _canchas = [];
  
  get canchas => _canchas;

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
