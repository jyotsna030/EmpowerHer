import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Import your screens
import 'screens/welcome_screen.dart';
import 'screens/verification_screen.dart';
import 'screens/report_screen.dart';
import 'screens/safety_plan_screen.dart';
import 'screens/chatbot_screen.dart';
import 'screens/emergency_screen.dart';
import 'screens/resources_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with web options if running on the web
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDznX_Dp0X6jcVb2W1FQX36N3sf6f4wLh0",
        authDomain: "empowerher-187ca.firebaseapp.com",
        projectId: "empowerher-187ca",
        storageBucket: "empowerher-187ca.appspot.com",
        messagingSenderId: "906979963078",
        appId: "1:906979963078:web:8b38b369da296ccfc2e7c7",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Support App',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: WelcomeScreen(),
      routes: {
        '/verification': (_) => VerificationScreen(),
        '/report': (_) => ReportScreen(),
        '/safetyPlan': (_) => SafetyPlanScreen(),
        '/chatbot': (_) => ChatbotScreen(),
        '/emergency': (_) => EmergencyScreen(),
        '/resources': (_) => ResourcesScreen(),
      },
    );
  }
}
