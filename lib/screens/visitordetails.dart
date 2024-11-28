// lib/screens/visitordetails.dart
import 'package:flutter/material.dart';

class VisitorDetailsPage extends StatelessWidget {
  const VisitorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor Details'),
      ),
      body: const Center(
        child: Text(
          'This is the Visitor Details Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
