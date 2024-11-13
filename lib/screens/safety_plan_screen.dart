import 'package:flutter/material.dart';
import '../services/location_service.dart';

class SafetyPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Safety Plan")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => LocationService().findNearbySafePlaces(),
          child: Text("Show Nearby Safe Locations"),
        ),
      ),
    );
  }
}
