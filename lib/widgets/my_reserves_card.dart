import 'package:flutter/material.dart';

class MyReservasCard extends StatelessWidget {
  const MyReservasCard({
    super.key,
    required this.size,
    required this.img,
  });

  final Size size;
  final List<String> img;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
              width: size.width,
              margin:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.3,
                    height: size.height * 0.2,
                    // color: Colors.blue,
                    child: Column(
                      children: [
                        Container(
                          width: size.width * 0.3,
                          height: size.height * 0.1 + 50,
                          // color: Colors.green,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: size.width * 0.1,
                            height: size.height * 0.1 - 50,
                            margin: const EdgeInsets.only(
                                left: 20, right: 10, bottom: 20, top: 25),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(img[index],
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(top: 20),
                          width: size.width * 0.5 + 30,
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Epic Box',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/img/pronostico.jpg',
                                          width: 20,
                                          height: 20,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 5),
                                        const Text(
                                          '30%',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
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
                                height: 6,
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
                                  SizedBox(width: 6),
                                  Flexible(
                                    child: Text(
                                      'Andrea Gomez',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text('2 horas',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16)),
                                  Container(
                                    margin:
                                        const EdgeInsets.only(left: 10),
                                    height:
                                        20, // Ajusta la altura según necesites
                                    width:
                                        1, // Ajusta el ancho para el grosor del divisor
                                    color:
                                        Colors.grey, // Color del divisor
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
                ],
              ));
        },
      ),
    );
  }
}
