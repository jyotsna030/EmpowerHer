import 'package:dialogflow_grpc/dialogflow_grpc.dart'; // Correct package import
import 'package:googleapis_auth/auth_io.dart'; // For Service Account Authentication
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:uuid/uuid.dart';

class AIService {
  late DialogflowGrpcV2Beta1 _dialogflow;
  final String projectId = 'empowerher-441416'; // Replace with your actual project ID

  // Constructor to initialize the Dialogflow client
  AIService() {
    _initializeDialogflow();
  }

  // Initialize Dialogflow with Service Account credentials
  Future<void> _initializeDialogflow() async {
    try {
      final serviceAccountData = await rootBundle.loadString('assets/empowerher-441416-b39d1592de5c.json');
      final serviceAccount = json.decode(serviceAccountData);

      // Initialize Dialogflow client with service account
      _dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
    } catch (e) {
      print('Error initializing Dialogflow: $e');
    }
  }

  // Generate a unique session ID
  String _generateSessionId() {
    var uuid = Uuid();
    return 'projects/$projectId/agent/sessions/${uuid.v4()}';
  }

  // Analyze a report using Dialogflow
  Future<String> analyzeReport(String reportText) async {
    try {
      final sessionId = _generateSessionId(); // Use dynamic session ID generation
      final request = DetectIntentRequest(
        queryInput: QueryInput(text: TextInput(text: reportText)),
      );

      // Detect intent using Dialogflow
      final response = await _dialogflow.detectIntent(request, sessionId);

      // Return response or default message
      return response.queryResult?.fulfillmentText ?? 'No response from Dialogflow';
    } catch (e) {
      return 'Error analyzing report: $e';
    }
  }

  // Get a chatbot response from Dialogflow
  Future<String> getChatbotResponse(String message) async {
    try {
      final sessionId = _generateSessionId(); // Use dynamic session ID generation
      final request = DetectIntentRequest(
        queryInput: QueryInput(text: TextInput(text: message)),
      );

      // Detect intent using Dialogflow
      final response = await _dialogflow.detectIntent(request, sessionId);

      // Return response or default message
      return response.queryResult?.fulfillmentText ?? 'No response from Dialogflow';
    } catch (e) {
      return 'Error getting chatbot response: $e';
    }
  }
}
