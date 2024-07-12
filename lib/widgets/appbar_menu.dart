import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppBarMenu extends StatelessWidget {
  const AppBarMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Color.fromARGB(255, 29, 187, 15),
            ],
          ),
        ),
      ),
      title: const Text(
        'Tennis court',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        const CircleAvatar(
          radius: 12,
          backgroundImage: AssetImage('assets/img/elipse.jpg'),
        ),
        IconButton(
          icon: const Icon(Icons.notifications_outlined,
              size: 30, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.logout, size: 25, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const InitSessionScreen()));
          },
        ),
        IconButton(
          icon: const Icon(Icons.menu, size: 30, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}
