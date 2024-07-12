import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../alerts/alert.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../routes/route_bottom_navigation.dart';

class PayCard extends StatefulWidget {
  const PayCard({super.key, required this.reserveDetailsCanchaSelected});
  final CanchasModels reserveDetailsCanchaSelected;

  @override
  State<PayCard> createState() => _PayCardState();
}

class _PayCardState extends State<PayCard> {
  static bool _hasExecutedForData1 = false;
  static bool _hasExecutedForData2 = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final userName = Provider.of<UserProvider>(context, listen: false).userName;
    final canchaFormProvider = Provider.of<CanchaFormProvider>(context);
    final getSpecificDayWeather = Provider.of<WeatherProvider>(context);
    final addCanchaToDB = Provider.of<CanchasProvider>(context);
    final originPrice = widget.reserveDetailsCanchaSelected.price;
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
                final data = await addCanchaToDB.newCancha(
                  AddCanchasModel(
                    title: widget.reserveDetailsCanchaSelected.title,
                    type: widget.reserveDetailsCanchaSelected.type,
                    image: widget.reserveDetailsCanchaSelected.image,
                    price: totalString,
                    horas: canchaFormProvider.horas.toString(),
                    starthour: widget.reserveDetailsCanchaSelected.starthour,
                    endhour: widget.reserveDetailsCanchaSelected.endhour,
                    date: canchaFormProvider.date.toString(),
                    comment: canchaFormProvider.comment,
                    renter: userName,
                    instructor: canchaFormProvider.instructor,
                    weather: getSpecificDayWeather.weatherSelecteDate,
                    createdAt: DateTime.now(),
                    canchaType: widget.reserveDetailsCanchaSelected.canchaType,
                  ),
                  canchaFormProvider.date.toString(),
                  widget.reserveDetailsCanchaSelected.starthour,
                  widget.reserveDetailsCanchaSelected.endhour,
                  widget.reserveDetailsCanchaSelected.canchaType,
                );
                getSpecificDayWeather.weatherSelecteDate = '';

                if (!_hasExecutedForData1 && data == 1) {
                  _hasExecutedForData1 = true;
                  return await reserveCreated(
                      context, widget.reserveDetailsCanchaSelected.canchaType);
                }

                if (_hasExecutedForData1) {
                  if (data == 1) {
                    return await maxReserve(context,
                        widget.reserveDetailsCanchaSelected.canchaType);
                  }

                  if (!_hasExecutedForData2 && data == 2) {
                    _hasExecutedForData2 = true;
                    return reserveCreated(
                      context, widget.reserveDetailsCanchaSelected.canchaType);
                  }

                  if(data == 2){
                    return await reserveAlreadyExist(context,);
                  }

                  return await reserveCreated(
                      context, widget.reserveDetailsCanchaSelected.canchaType);
                }

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
