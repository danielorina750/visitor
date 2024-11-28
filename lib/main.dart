import 'package:flutter/material.dart';
import 'screens/landingpage.dart'; // Import the landing page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set LandingPage as the home page
      home: const LandingPage(),
    );
  }
}
