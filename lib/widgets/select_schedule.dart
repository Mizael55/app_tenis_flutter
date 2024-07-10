import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Asegúrate de agregar intl a tus dependencias en pubspec.yaml

class SelectingSchedule extends StatefulWidget {
  const SelectingSchedule({
    super.key,
  });

  @override
  State<SelectingSchedule> createState() => _SelectingScheduleState();
}

class _SelectingScheduleState extends State<SelectingSchedule> {
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
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
            const Text('Establecer fecha y hora',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                    icon:
                        const Icon(Icons.keyboard_arrow_down_rounded, size: 40),
                    onPressed: () => _selectDate(context),
                  ),
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
                    horizontal: 8,
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
                            size: 40),
                        onPressed: () =>
                            _selectTime(context, isStartTime: true),
                      ),
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
                            size: 40),
                        onPressed: () =>
                            _selectTime(context, isStartTime: false),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Agregar un comentario',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Container(
              height: 100, // Establece la altura deseada
              child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4, // Ajusta esto según tus necesidades
                  decoration: InputDecoration(
                      hintText: "Escribe tu comentario aquí...",
                      filled: true, // Habilita el relleno de color
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ))),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const HomeScreen(),
                //   ),
                // );
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
