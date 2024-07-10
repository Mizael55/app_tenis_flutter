import 'package:flutter/material.dart';

class PayCard extends StatelessWidget {
  const PayCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.blue,
      width: size.width,
      height: size.height * 0.5,
    );
  }
}
