import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class WeatherProvider extends ChangeNotifier {
  final String apiKey = 'f4b6a013f2ef451eb68eb9e151558b5a';
  final String city = 'Santo Domingo';
  final String country = 'DO';
  final int days = 30;
  List weatherData = [];

  Future<void> fetchWeatherData() async {
    final url =
        'http://api.weatherbit.io/v2.0/current?city=$city&country=$country&key=$apiKey&units=M';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      weatherData = data['data'];
      notifyListeners();
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  Future<String> getWeatherByDate(String date) async {
    final url =
        'http://api.weatherbit.io/v2.0/forecast/daily?city=$city&country=$country&key=$apiKey&units=M&start_date=$date&end_date=$date';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final weather = data['data'][0]['clouds'];
      final weatherInt = weather.toInt();
      final weatherString = weatherInt.toString();
      return weatherString;
    } else {
      throw Exception('Error al cargar los datos');
    }
  }
}
