import 'package:flutter/material.dart';
import 'package:flutter_app/screens/landingpage.dart'; // Import Landing Page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LandingPage(),
    );
  }
}
