import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final TextEditingController _reportController = TextEditingController();

  void _submitReport() async {
    String riskAssessment = await AIService().analyzeReport(_reportController.text);
    // Display risk assessment
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _reportController,
              decoration: InputDecoration(hintText: "Describe the incident"),
            ),
            ElevatedButton(onPressed: _submitReport, child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
