import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';

class SelectScreenRoute extends StatelessWidget {
  const SelectScreenRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final handleRouteProvider = Provider.of<HandleRouteProvider>(context);
    final getCanchasList = Provider.of<CanchasProvider>(context, listen: false);
    final currentIndex = handleRouteProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        getCanchasList.getCanchasJson();
        getCanchasList.loadAllCanchaRentered();
        return const HomeScreen();
      case 1:
        return const ReservesDoneScreen();
      case 2:
        return const FavoriteScreen();
      default:
        return const HomeScreen();
    }
  }
}
