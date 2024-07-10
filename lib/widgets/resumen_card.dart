import 'package:flutter/material.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.2 - 30,
        color: Colors.blue[50],
        child: const Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Resumen',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.sports_tennis, size: 20),
                      SizedBox(width: 5),
                      Text('Cancha tipo A', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 20),
                      SizedBox(width: 5),
                      Text('10 de julio 2024', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
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
