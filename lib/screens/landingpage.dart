// lib/screens/landingpage.dart
import 'package:flutter/material.dart';
import 'dart:async'; // To add delay for navigation
import 'optionpage.dart'; // Import the OptionPage correctly


// The LandingPage widget
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    // Delay the transition to the OptionPage after 5 seconds
    Timer(const Duration(seconds: 15), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OptionPage()), // Go to the OptionPage
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'asset/bgsecurityedit.png', // Add your image path here
              fit: BoxFit.cover,
            ),
          ),
          // Centered Welcome Text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                // Expanded widget to push the logo to the bottom
                Expanded(child: Container()),
                // Logo at the bottom of the screen
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'asset/ecologo.png', // Add your logo path here
                      height: 100, // Adjust logo size
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
