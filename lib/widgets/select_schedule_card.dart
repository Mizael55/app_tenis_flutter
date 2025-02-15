import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';

class SelectingScheduleAndBottom extends StatefulWidget {
  const SelectingScheduleAndBottom({
    super.key,
    required this.canchaDetails,
  });

  final CanchasModels canchaDetails;

  @override
  State<SelectingScheduleAndBottom> createState() =>
      _SelectingScheduleAndBottomState();
}

class _SelectingScheduleAndBottomState
    extends State<SelectingScheduleAndBottom> {
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime
          .now(),
      lastDate: DateTime(2028),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context,
      {required bool isStartTime}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? startTime ?? TimeOfDay.now()
          : endTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final canchaFormProvider = Provider.of<CanchaFormProvider>(context);
    final getSpecificDayWeather = Provider.of<WeatherProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue[50],
      width: size.width,
      height: size.height * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Establecer fecha y hora',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Icon(
                      Icons.cloudy_snowing,
                      color: Colors.black,
                      size: 22,
                    ),
                    const SizedBox(width: 2),
                    getSpecificDayWeather.weatherSelecteDate == ''
                        ? const Text('0%')
                        : Text(
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
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedDate == null
                      ? 'Fecha'
                      : DateFormat('yyyy-MM-dd').format(selectedDate!)),
                  IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded,
                          size: 25),
                      onPressed: () async {
                        await _selectDate(context);
                        canchaFormProvider.date =
                            DateFormat('yyyy-MM-dd').format(selectedDate!);
                        await getSpecificDayWeather.getWeatherByDate(
                            canchaFormProvider.date.toString());
                      }),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(startTime == null
                          ? 'Hora de inicio'
                          : startTime!.format(context)),
                      IconButton(
                          icon: const Icon(Icons.keyboard_arrow_down_rounded,
                              size: 25),
                          onPressed: () async {
                            await _selectTime(context, isStartTime: true);
                            canchaFormProvider.horaInicio =
                                startTime!.format(context);
                          }),
                    ],
                  ),
                ),
                Container(
                  width: size.width * 0.4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(endTime == null
                          ? 'Hora de fin'
                          : endTime!.format(context)),
                      IconButton(
                          icon: const Icon(Icons.keyboard_arrow_down_rounded,
                              size: 25),
                          onPressed: () async {
                            await _selectTime(context, isStartTime: false);
                            canchaFormProvider.horaFin =
                                endTime!.format(context);
                          }),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text('Agregar un comentario',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Container(
              height: 100,
              child: TextField(
                autofocus: false,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                onChanged: (value) {
                  canchaFormProvider.comment = value;
                },
                decoration: InputDecoration(
                    hintText: "Agrega un comentario...",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    )),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                if (canchaFormProvider.date.isEmpty ||
                    canchaFormProvider.horaInicio.isEmpty ||
                    canchaFormProvider.horaFin.isEmpty ||
                    canchaFormProvider.instructor.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      content: Center(
                          child: Text(
                        'Por favor, complete los campos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  );
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResumeScreen(
                      canchaDetails: widget.canchaDetails,
                    ),
                  ),
                );
              },
              child: Container(
                width: size.width,
                height: size.height / 14,
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
      ),
    );
  }
}
