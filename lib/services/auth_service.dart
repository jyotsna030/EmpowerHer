import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) => print("Verification Failed: ${e.message}"),
      codeSent: (String verificationId, int? resendToken) => print("Code sent."),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
