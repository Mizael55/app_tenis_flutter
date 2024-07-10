import 'package:flutter/material.dart';

class ReservasProgramadasCard extends StatelessWidget {
  const ReservasProgramadasCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final img = [
      'assets/img/Enmascarargrupo2.jpg',
      'assets/img/Enmascarargrupo.jpg',
      'assets/img/Enmascarargrupo1.jpg',
    ];
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      // color: Colors.blue,
      height: size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Text(
              'Reservas programadas',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                    color: Colors.blue[50],
                    elevation: 0,
                    margin: const EdgeInsets.only(left: 0, right: 0, bottom: 6),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero),
                    child: SizedBox(
                        width: size.width,
                        height: size.height * 0.2,
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.3,
                              height: size.height,
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.3,
                                    height: size.height * 0.1 + 50,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: size.width * 0.1,
                                      height: size.height * 0.1 - 50,
                                      margin: const EdgeInsets.only(
                                          left: 20,
                                          right: 10,
                                          bottom: 20,
                                          top: 25),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(img[index],
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.7,
                              height: size.height,
                              child: Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(top: 20),
                                      width: size.width * 0.7,
                                      height: size.height * 0.2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text('Epic Box',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              )),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.calendar_today,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              SizedBox(width: 8),
                                              Text('9 de julio 2024',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Row(
                                            children: [
                                              Text('Reservado por:',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16)),
                                              SizedBox(width: 6),
                                              CircleAvatar(
                                                radius: 10,
                                                backgroundImage: AssetImage(
                                                    'assets/img/elipse.jpg'),
                                              ),
                                              SizedBox(width: 8),
                                              Text('Andrea Gomez',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16)),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.access_time,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              const Text('2 horas',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16)),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10),
                                                height:
                                                    20, // Ajusta la altura según necesites
                                                width:
                                                    1, // Ajusta el ancho para el grosor del divisor
                                                color: Colors
                                                    .grey, // Color del divisor
                                              ),
                                              const SizedBox(width: 8),
                                              const Text('\$200',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16)),
                                            ],
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )));
              },
            ),
          )
        ],
      ),
    );
  }
}
