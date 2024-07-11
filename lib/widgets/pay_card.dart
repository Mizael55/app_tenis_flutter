import 'package:flutter/material.dart';

class PayCard extends StatelessWidget {
  const PayCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: size.width,
        height: size.height * 0.3 + 50,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total a pagar',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                Column(
                  children: [
                    Text('\$50',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    const Text('por 2 horas',
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ],
                )
              ],
            ),
            Container(
              width: size.width * 0.7,
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.credit_card, color: Colors.blue[800]),
                  const SizedBox(width: 10),
                  Text('Reprogramar reserva',
                      style: TextStyle(color: Colors.blue[800], fontSize: 16)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const InitSessionScreen(),
                //   ),
                // );
              },
              child: Container(
                width: size.width,
                height: size.height / 14,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 92, 141, 9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text('Pagar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const InitSessionScreen(),
                //   ),
                // );
              },
              child: Container(
                width: size.width,
                height: size.height / 14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text('Cancelar',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold))),
              ),
            ),
          ],
        ));
  }
}
