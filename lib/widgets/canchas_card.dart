import 'package:flutter/material.dart';
import '../screens/screens.dart';

class CanchasCard extends StatelessWidget {
  const CanchasCard({
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
      height: size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text('Canchas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  )),
            ),
            Container(
              width: size.width,
              height: size.height * 0.5,
              margin: const EdgeInsets.only(top: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width * 0.7,
                    height: size.height * 0.3,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: size.width,
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(img[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Row(
                            children: [
                              const Text(
                                'Epic Box',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                ),
                              ),
                              const Spacer(),
                              Row(
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
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text('9 de julio 2024',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              Text('Disponible',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16)),
                              SizedBox(width: 2),
                              CircleAvatar(
                                radius: 5,
                                backgroundColor: Colors.blue,
                              ),
                              SizedBox(width: 2),
                              Icon(
                                Icons.access_time,
                                color: Colors.black,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              Flexible(
                                child: Text('7:00 am - 4:00 pm',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReserveScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: size.width * 0.5,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.1,
                                vertical: size.height * 0.01),
                            margin: const EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 92, 141, 9),
                            ),
                            child: const Center(
                                child: Text('Reservar',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
