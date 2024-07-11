import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';

class SelectScreenRoute extends StatelessWidget {
  const SelectScreenRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final handleRouteProvider = Provider.of<HandleRouteProvider>(context);
    final currentIndex = handleRouteProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ReservesDoneScreen();
      default:
        return const HomeScreen();
    }
  }
}