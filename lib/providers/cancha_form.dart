import 'package:flutter/material.dart';

class CanchaFormProvider extends ChangeNotifier {
  String _date = '';
  String _horaInicio = '';
  String _horaFin = '';
  String _instructor = '';
  String _comment = '';

  String get date => _date;
  String get horaInicio => _horaInicio;
  String get horaFin => _horaFin;
  String get instructor => _instructor;
  String get comment => _comment;

  CanchaFormProvider() {
    reset();
  }

  void reset() {
    _date = '';
    _horaInicio = '';
    _horaFin = '';
    _instructor = '';
    _comment = '';
  }

 get horas {
  // Función auxiliar para convertir hora 12h a minutos totales
  int convertirAHoras24(String hora12h) {
    final partes = hora12h.split(' ');
    final tiempo = partes[0].split(':');
    final periodo = partes[1]; // AM o PM
    var horas = int.parse(tiempo[0]);
    final minutos = int.parse(tiempo[1]);

    if (periodo.toUpperCase() == 'PM' && horas < 12) {
      horas += 12;
    } else if (periodo.toUpperCase() == 'AM' && horas == 12) {
      horas = 0;
    }

    return horas * 60 + minutos;
  }

  final minutosInicio = convertirAHoras24(_horaInicio);
  final minutosFin = convertirAHoras24(_horaFin);

  // Calcular la diferencia en minutos
  int minutosDiferencia = minutosFin - minutosInicio;

  // Si la diferencia es negativa, se asume que la hora de fin es del día siguiente
  if (minutosDiferencia < 0) {
    minutosDiferencia += 24 * 60; // Sumar 24 horas convertidas a minutos
  }

  // Convertir la diferencia de minutos a horas
  final horas = minutosDiferencia ~/ 60;

  return horas;
}

  set date(String value) {
    _date = value;
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
