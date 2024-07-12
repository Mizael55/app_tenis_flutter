import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../alerts/delete_alert.dart';
import '../providers/providers.dart';

class MyReservasCard extends StatelessWidget {
  const MyReservasCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final getCanchasResevered = Provider.of<CanchasProvider>(context);
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: getCanchasResevered.canchasRenteredList.length,
        itemBuilder: (context, index) {
          final cancha = getCanchasResevered.canchasRenteredList[index];
          return Container(
              width: size.width,
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                                child: Image.asset(cancha.image,
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
                                  Text(cancha.title,
                                      style: const TextStyle(
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
                                        const SizedBox(width: 4),
                                        Text(
                                          cancha.weather + '%',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(cancha.date,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  const Text('Reservado por:',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                  const SizedBox(width: 6),
                                  const CircleAvatar(
                                    radius: 10,
                                    backgroundImage:
                                        AssetImage('assets/img/elipse.jpg'),
                                  ),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: Text(
                                      cancha.renter,
                                      style: const TextStyle(
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
                                height: 2,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text('${cancha.horas} horas',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 20,
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text('\$${cancha.price}',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16)),
                                  DeleteBottomAlert(
                                      getCanchasResevered: getCanchasResevered,
                                      cancha: cancha)
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
