import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBarMenu(),
      ),
      body: Center(
        child: Text('Favorite Screen'),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
