import 'package:flutter/material.dart';

class CanchaFormProvider extends ChangeNotifier {
  String _fecha = '';
  String _horaInicio = '';
  String _horaFin = '';
  String _instructor = '';
  String _comment = '';

  String get fecha => _fecha;
  String get horaInicio => _horaInicio;
  String get horaFin => _horaFin;
  String get instructor => _instructor;
  String get comment => _comment;

  CanchaFormProvider() {
    reset();
  }

  void reset() {
    _fecha = '';
    _horaInicio = '';
    _horaFin = '';
    _instructor = '';
    _comment = '';
  }

  get horas {
    final horaInicio = int.parse(_horaInicio.split(':')[0]);
    final horaFin = int.parse(_horaFin.split(':')[0]);
    return horaFin - horaInicio;
  }

  set fecha(String value) {
    _fecha = value;
    notifyListeners();
  }

  set horaInicio(String value) {
    _horaInicio = value;
    notifyListeners();
  }

  set horaFin(String value) {
    _horaFin = value;
    notifyListeners();
  }

  set instructor(String value) {
    _instructor = value;
    notifyListeners();
  }

  set comment(String value) {
    _comment = value;
    notifyListeners();
  }
}
