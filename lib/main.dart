import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ibreez/screen/admin_home.dart';
import 'package:firebase_ibreez/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  //initaluization of firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/homepage': (context) => const Homepage(),
      },
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
