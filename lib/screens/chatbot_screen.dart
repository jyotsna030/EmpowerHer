import 'package:flutter/material.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:uuid/uuid.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  DialogflowGrpcV2Beta1? dialogflow;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> messages = [];
  late String sessionId;

  @override
  void initState() {
    super.initState();
    _initializeDialogflow();
    _generateSessionId();
  }

  Future<void> _initializeDialogflow() async {
    // Load the service account file from assets
    final serviceAccountData = await rootBundle.loadString('assets/empowerher-441416-b39d1592de5c.json');
    final serviceAccount = json.decode(serviceAccountData);

    // Initialize the Dialogflow instance
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  // Generate a unique session ID using Uuid
  void _generateSessionId() {
    var uuid = Uuid();
    sessionId = 'projects/empowerher-441416/agent/sessions/${uuid.v4()}'; // Replace YOUR_PROJECT_ID with actual project ID
  }

  void _sendMessage() async {
    final text = _controller.text;
    if (text.isNotEmpty && dialogflow != null) {
      // Add user message to the chat
      setState(() {
        messages.add({'sender': 'user', 'text': text});
      });

      // Send message to Dialogflow
      final response = await dialogflow!.detectIntent(
        DetectIntentRequest(
          queryInput: QueryInput(text: TextInput(text: text)),
        ),
        sessionId, // Use the dynamically generated session ID
      );

      // Handle potential null values from the response
      final botReply = response.queryResult?.fulfillmentText ?? "Sorry, I didn't get that.";

      // Add bot response to the chat
      setState(() {
        messages.add({'sender': 'bot', 'text': botReply});
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['sender'] == 'user';
                return ListTile(
                  title: Align(
                    alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      color: isUser ? Colors.blue : Colors.grey[300],
                      child: Text(message['text'] ?? ''),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
