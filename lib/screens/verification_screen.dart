import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  Future<void> _verifyPhone() async {
    await AuthService().verifyPhoneNumber(_phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Enter phone number'),
            ),
            ElevatedButton(onPressed: _verifyPhone, child: Text("Send OTP")),
            TextField(
              controller: _otpController,
              decoration: InputDecoration(labelText: 'Enter OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
