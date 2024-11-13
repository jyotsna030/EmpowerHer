import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: [
        DropdownMenuItem(value: "en", child: Text("English")),
        DropdownMenuItem(value: "es", child: Text("Spanish")),
      ],
      onChanged: (value) {
        // Set language based on selection
      },
      hint: Text("Select Language"),
    );
  }
}
