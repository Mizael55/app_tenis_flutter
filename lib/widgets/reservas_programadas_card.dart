import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class ReservasProgramadasCard extends StatelessWidget {
  const ReservasProgramadasCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getCanchasResevered = Provider.of<CanchasProvider>(context);
    return getCanchasResevered.canchasRenteredList.isEmpty
        ? const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'No hay reservas programadas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        : SizedBox(
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
                    itemCount: getCanchasResevered.canchasRenteredList.length,
                    itemBuilder: (context, index) {
                      final cancha =
                          getCanchasResevered.canchasRenteredList[index];
                      return Card(
                          color: Colors.blue[50],
                          elevation: 0,
                          margin: const EdgeInsets.only(
                              left: 0, right: 0, bottom: 6),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                                child: Image.asset(cancha.image,
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
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            width: size.width * 0.7,
                                            height: size.height * 0.2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(cancha.title,
                                                        style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                    // agrega un icon para e;iminar
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      child: IconButton(
                                                          icon: const Icon(
                                                              Icons.delete),
                                                          onPressed: () async {
                                                            await getCanchasResevered
                                                                .deleteCancha(
                                                                    cancha.id);
                                                          }),
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
                                                            color: Colors.black,
                                                            fontSize: 16)),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 6,
                                                ),
                                                Row(
                                                  children: [
                                                    const Text('Reservado por:',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16)),
                                                    const SizedBox(width: 6),
                                                    const CircleAvatar(
                                                      radius: 10,
                                                      backgroundImage: AssetImage(
                                                          'assets/img/elipse.jpg'),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(cancha.renter,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16)),
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
                                                    Text(
                                                        '${cancha.horas} horas',
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16)),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 10),
                                                      height:
                                                          20, // Ajusta la altura según necesites
                                                      width:
                                                          1, // Ajusta el ancho para el grosor del divisor
                                                      color: Colors
                                                          .grey, // Color del divisor
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text('\$ ${cancha.price}',
                                                        style: const TextStyle(
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
