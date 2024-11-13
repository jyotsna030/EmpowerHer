import 'package:flutter/material.dart';
import '../widgets/language_selector.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEDCE0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            LanguageSelector(), // Widget for language selection
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/report'),
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFF48FB1)),
              child: Text("I need help"),
            ),
            TextButton(onPressed: () {}, child: Text("Learn More")),
          ],
        ),
      ),
    );
  }
}
