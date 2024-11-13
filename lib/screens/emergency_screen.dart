import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class EmergencyScreen extends StatelessWidget {
  void _triggerEmergencyAlert() {
    NotificationService().sendEmergencyAlert();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: _triggerEmergencyAlert,
          child: Text("Emergency Alert"),
        ),
      ),
    );
  }
}
