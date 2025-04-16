import 'dart:async';
import 'package:flutter/material.dart';
import 'package:MindIt/LanguageSwitchPage.dart';
import 'package:firebase_core/firebase_core.dart';

//8124720122

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Impeller.disable();
  try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCOOz0K4VhIfOF5T1V4uxz6AuPs-7uqyMw",
        authDomain: "mental-well-being-569f8.firebaseapp.com",
        projectId: "mental-well-being-569f8",
        storageBucket: "mental-well-being-569f8.appspot.com",
        messagingSenderId: "537568471428",
        appId: "1:537568471428:web:5fa14bbadf8265f48215d1",
      ),
    );
    //print('Firebase initialized');
  } catch (e) {
    //print('Error initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LanguageSwitchPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
      body: Center(
        child: SizedBox(
          width: 350,
          height: 350,
          child: Image.asset('assets/logo.jpg'),
        ),
      ),
    );
  }
}
