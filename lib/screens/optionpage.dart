// lib/screens/optionpage.dart
import 'package:flutter/material.dart';
import 'contractordetails.dart';  // Import the ContractorDetailsPage
import 'visitordetails.dart';    // Import the VisitorDetailsPage

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Option Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Contractor Details Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the ContractorDetailsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContractorDetailsPage()),
                );
              },
              child: const Text('Go to Contractor Details'),
            ),
            const SizedBox(height: 20),
            // Visitor Details Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the VisitorDetailsPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VisitorDetailsPage()),
                );
              },
              child: const Text('Go to Visitor Details'),
            ),
          ],
        ),
      ),
    );
  }
}
