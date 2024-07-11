import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ReservesDoneScreen extends StatelessWidget {
  const ReservesDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Commonly 56.0
        child: AppBarMenu(),
      ),
      body: Center(
        child: Text('ReservesDoneScreen'),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
