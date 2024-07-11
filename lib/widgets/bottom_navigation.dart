import 'package:app_tenis/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final handleRouteProvider = Provider.of<HandleRouteProvider>(context);
    final currentIndex = handleRouteProvider.selectedMenuOpt;
    return BottomNavigationBar(
      currentIndex: currentIndex,
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
      onTap: (i) {
        handleRouteProvider.selectedMenuOpt = i;
      },
      selectedItemColor: const Color.fromARGB(255, 29, 187, 15),
      unselectedItemColor: Colors.black45,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      // agregale un color de fondo al icono seleccionado
    );
  }
}
