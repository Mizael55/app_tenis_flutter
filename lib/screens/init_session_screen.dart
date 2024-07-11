import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../routes/route_bottom_navigation.dart';
import 'screens.dart';

class InitSessionScreen extends StatefulWidget {
  const InitSessionScreen({super.key});

  @override
  State<InitSessionScreen> createState() => _InitSessionScreenState();
}

class _InitSessionScreenState extends State<InitSessionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: <Widget>[
        Stack(children: [
          SizedBox(
            width: size.width,
            height: size.height / 3.2,
            child: Image.asset(
              'assets/img/Enmascarargrupo3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 64, 163, 68),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
        ]),
        Expanded(
          child: Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            height: size.height - size.height / 2.5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Iniciar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Sesión',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 52, 107, 195),
                    height: 4,
                    // acortala
                    endIndent: 280,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'El email no puede estar vacio';
                              }
                              if (!value.contains('@')) {
                                return 'El email no es valido';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                              hintText: 'usuario@gmail.com',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'La contraseña no puede estar vacia';
                              }
                              if (value.length < 6) {
                                return 'La contraseña debe tener al menos 6 caracteres';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              labelText: 'Contraseña',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.black,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.black,
                              ),
                              hintText: '**********',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                value: false,
                                onChanged: (value) {},
                              ),
                              const Text('Recordar contraseña',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                '¿Olvidaste tu contraseña?',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 52, 107, 195),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                final data = await Provider.of<UserProvider>(
                                        context,
                                        listen: false)
                                    .loadUser(_emailController.text,
                                        _passwordController.text);

                                if (data != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SelectScreenRoute(),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Center(
                                        child: Text(
                                            'El email o la contraseña son incorrectos'),
                                      ),
                                    ),
                                  );
                                }
                              }
                            },
                            child: Container(
                              width: size.width,
                              height: size.height / 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 92, 141, 9),
                              ),
                              child: const Center(
                                  child: Text('Iniciar sesión',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '¿Aun no tienes cuenta? ',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterSessionScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Registrate',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 52, 107, 195),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
