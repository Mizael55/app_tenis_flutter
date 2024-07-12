import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getCanchasList = Provider.of<CanchasProvider>(context).canchas;
    final userName = Provider.of<UserProvider>(context).userName;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Commonly 56.0
        child: AppBarMenu(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.1,
              padding: const EdgeInsets.only(top: 20, left: 20),
              child:  Text(
                'Hola $userName!',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              height: 0,
            ),
            CanchasCard(canchasList: getCanchasList),
            Divider(
              color: Colors.grey.shade400,
              height: 0,
            ),
            const ReservasProgramadasCard()
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
