import 'package:flutter/material.dart';
import 'package:flutter_app/screens/contractordetails.dart'; // Import Contractor Details Page
import 'package:flutter_app/screens/visitordetails.dart'; // Import Visitor Details Page

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Option'),
        backgroundColor: Colors.indigo[900], // Navy Blue theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title text
            Text(
              'Choose your option',
              style: TextStyle(
                fontSize: 28, // Slightly larger font size for emphasis
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900], // Navy Blue
              ),
            ),
            const SizedBox(height: 40), // Adjust spacing between text and buttons
            // Contractor Details button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContractorDetailsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[900], // Button background color
                foregroundColor: Colors.white, // Text color
              ),
              child: const Text(
                'Contractor Details',
                style: TextStyle(fontSize: 18), // Text size inside button
              ),
            ),
            const SizedBox(height: 20), // Spacing between buttons
            // Visitor Details button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VisitorDetailsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo[900], // Button background color
                foregroundColor: Colors.white, // Text color
              ),
              child: const Text(
                'Visitor Details',
                style: TextStyle(fontSize: 18), // Text size inside button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
