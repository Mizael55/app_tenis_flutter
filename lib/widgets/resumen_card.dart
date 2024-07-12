import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard({super.key, required this.reserveDetailsCanchaSelected});
  final CanchasModels reserveDetailsCanchaSelected;

  @override
  Widget build(BuildContext context) {
    final canchaFormProvider = Provider.of<CanchaFormProvider>(context);
    final Size size = MediaQuery.of(context).size;
    final getSpecificDayWeather = Provider.of<WeatherProvider>(context);
    return Container(
        width: size.width,
        height: size.height * 0.2 - 30,
        color: Colors.blue[50],
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Resumen',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                       Row(
                  children: [
                    const Icon(
                      Icons.cloudy_snowing,
                      color: Colors.black,
                      size: 22,
                    ),
                    const SizedBox(width: 2),
                    getSpecificDayWeather.weatherSelecteDate == ''
                        ? const CircularProgressIndicator.adaptive()
                        :
                    Text(
                      '${getSpecificDayWeather.weatherSelecteDate}%',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.sports_tennis, size: 20),
                      const SizedBox(width: 5),
                      Text(reserveDetailsCanchaSelected.type,
                          style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 20),
                      const SizedBox(width: 5),
                      Text(canchaFormProvider.date.toString(),
                          style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person_2_outlined, size: 20),
                      const SizedBox(width: 5),
                      Text('Instructor: ${canchaFormProvider.instructor}',
                          style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 20),
                      const SizedBox(width: 5),
                      Text(' ${canchaFormProvider.horas} horas',
                          style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
