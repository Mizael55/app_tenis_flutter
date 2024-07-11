import 'package:flutter/material.dart';
import '../db/db.dart';
import 'screens.dart';

class InitOrRegisterSessionScreen extends StatelessWidget {
  const InitOrRegisterSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DBProvider.db.database;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/grupo20.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: size.height / 7,
            left: size.width / 4,
            child: SizedBox(
              width: size.width / 2,
              child: Image.asset(
                'assets/img/logo1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InitSessionScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: size.width,
                    height: size.height / 12,
                    decoration: inpuDecoration(
                      const Color.fromARGB(255, 92, 141, 9),
                      const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 92, 141, 9),
                          Color.fromARGB(255, 92, 141, 9),
                        ],
                      ),
                    ),
                    child: const Center(
                        child: TextDecoration(
                            text: 'Iniciar sesión',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterSessionScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: size.width,
                    height: size.height / 12,
                    decoration: inpuDecoration(
                      // agregar color blanco con una opacidad de 0.5
                      const Color(0x80FFFFFF),
                      const LinearGradient(
                        colors: [
                          Color(0x80FFFFFF),
                          Color(0x80FFFFFF),
                        ],
                      ),
                    ),
                    child: const Center(
                        child: TextDecoration(
                            text: 'Registrarme',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration inpuDecoration(Color color, LinearGradient? linearGradient) {
    return BoxDecoration(
      gradient: linearGradient,
      color: color,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }
}

class TextDecoration extends StatelessWidget {
  const TextDecoration({
    super.key,
    required this.text,
    required this.style,
  });

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
