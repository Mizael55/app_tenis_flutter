import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class ReservesDoneScreen extends StatelessWidget {
  const ReservesDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getCanchasResevered = Provider.of<CanchasProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Commonly 56.0
        child: AppBarMenu(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: size.height / 13,
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 92, 141, 9),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                SizedBox(width: 10),
                Text(
                  'Programar reserva',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Mis Reservas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          getCanchasResevered.canchasRenteredList.isEmpty
              ? const Center(
                  child: Text('No hay reservas programadas',
                      style: TextStyle(fontSize: 20)),
                )
              : const MyReservasCard()
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
