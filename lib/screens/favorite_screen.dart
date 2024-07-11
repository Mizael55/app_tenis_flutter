import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Commonly 56.0
        child: AppBarMenu(),
      ),
      body: Center(
        child: Text('FavoriteScreen'),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
