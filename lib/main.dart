import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/providers.dart';
import 'screens/screens.dart';

void main(){
 WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HandleRouteProvider()),
        ChangeNotifierProvider(create: (context) => CanchasProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tenis Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const InitOrRegisterSessionScreen(),
      ),
    );
  }
}

