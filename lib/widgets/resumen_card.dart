import 'package:flutter/material.dart';

import '../models/models.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard({super.key, required this.reserveDetailsCanchaSelected});
  final CanchasModels reserveDetailsCanchaSelected;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              const Text('Resumen',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                      Text(DateTime.now().toString().substring(0, 10),
                          style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_2_outlined, size: 20),
                      SizedBox(width: 5),
                      Text('Instructor: Mark Gonzales',
                          style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 20),
                      SizedBox(width: 5),
                      Text('2 horas', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
