import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../routes/route_bottom_navigation.dart';

class PayCard extends StatelessWidget {
  const PayCard({super.key, required this.reserveDetailsCanchaSelected});
  final CanchasModels reserveDetailsCanchaSelected;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final userName = Provider.of<UserProvider>(context, listen: false).userName;
    final canchaFormProvider = Provider.of<CanchaFormProvider>(context);
    final getSpecificDayWeather = Provider.of<WeatherProvider>(context);
    final addCanchaToDB = Provider.of<CanchasProvider>(context);
    final originPrice = reserveDetailsCanchaSelected.price;
    final total = int.parse(originPrice) * canchaFormProvider.horas;
    final totalString = total.toString();

    return Container(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: size.width,
        height: size.height * 0.3 + 50,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total a pagar',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                Column(
                  children: [
                    Text('\$ $totalString',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('${canchaFormProvider.horas} horas',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14)),
                  ],
                )
              ],
            ),
            Container(
              width: size.width * 0.7,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.credit_card, color: Colors.blue[800]),
                  const SizedBox(width: 10),
                  Text('Reprogramar reserva',
                      style: TextStyle(color: Colors.blue[800], fontSize: 16)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                await addCanchaToDB.newCancha(
                  AddCanchasModel(
                    title: reserveDetailsCanchaSelected.title,
                    type: reserveDetailsCanchaSelected.type,
                    image: reserveDetailsCanchaSelected.image,
                    price: totalString,
                    horas: canchaFormProvider.horas.toString(),
                    starthour: reserveDetailsCanchaSelected.starthour,
                    endhour: reserveDetailsCanchaSelected.endhour,
                    date: canchaFormProvider.fecha.toString(),
                    comment: canchaFormProvider.comment,
                    renter: userName,
                    instructor: canchaFormProvider.instructor,
                    weather: getSpecificDayWeather.weatherSelecteDate,
                    createdAt: DateTime.now(),
                    reserveNum: reserveDetailsCanchaSelected.reserveNum,
                  ),
                );

                getSpecificDayWeather.weatherSelecteDate = '';

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectScreenRoute(),
                  ),
                );
              },
              child: Container(
                width: size.width,
                height: size.height / 14,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 92, 141, 9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text('Pagar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                CanchaFormProvider();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectScreenRoute(),
                  ),
                );
              },
              child: Container(
                width: size.width,
                height: size.height / 14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text('Cancelar',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
              ),
            ),
          ],
        ));
  }
}
