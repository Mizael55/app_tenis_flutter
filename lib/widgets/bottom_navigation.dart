import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 34),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month, size: 34),
          label: 'Reservas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border, size: 34),
          label: 'Favoritos',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 29, 187, 15),
      unselectedItemColor: Colors.black45,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      // agregale un color de fondo al icono seleccionado
    );
  }
}
