
# Flutter Dialogflow Chatbot Integration

## Installation and Setup Guide for Dialogflow Chatbot in Flutter

### Install Dependencies

Run the following command to install all required dependencies:

```bash
flutter pub get
```

---

## Configuration

### Dialogflow Authentication

1. **Obtain your Dialogflow credentials** by creating a service account in your Google Cloud Console.
2. **Download the `service-account.json`** file.
3. Alternatively, generate an API key in your Dialogflow console.

### Add Credentials to Your Project

1. Place the `service-account.json` file in your project under the `assets/` folder.
2. Update the `AIService` class to point to the correct file path where you placed your service account key.
3. For API key authentication, replace `YOUR_DIALOGFLOW_API_KEY` with your actual API key in `AIService.dart`.

### Update `pubspec.yaml`

Ensure your `pubspec.yaml` includes the necessary dependencies. Add `dialogflow_grpc` to your dependencies:

```yaml
dependencies:
  flutter:
    sdk: flutter
  dialogflow_grpc: ^0.3.0  # or latest version
  json_annotation: ^4.6.0
```

### Assets Configuration

In your `pubspec.yaml`, ensure the assets are configured as follows:

```yaml
flutter:
  assets:
    - assets/service-account.json
```

---

## Usage

### Running the App

After configuring the credentials, you can run the Flutter app on an emulator or a physical device using:

```bash
flutter run
```

### Chatbot Interaction

Once the app is running, you can interact with the chatbot by typing messages into the input field. The app sends the user's message to Dialogflow, and the chatbot will respond based on your Dialogflow agent’s configuration.

---

## Folder Structure

Here’s an overview of the key folder structure in this project:

```plaintext
/flutter-dialogflow-chatbot
├── assets/
│   └── service-account.json            # Your service account credentials
├── lib/
│   ├── main.dart                       # Main entry point for the app
│   ├── screens/
│   │   └── chatbot_screen.dart         # Chatbot UI Screen
│   ├── services/
│   │   └── ai_service.dart             # Service to interact with Dialogflow
└── pubspec.yaml                        # Project dependencies and configuration
```

**Explanation of Files:**
- `main.dart`: The main entry point of the Flutter app.
- `chatbot_screen.dart`: Contains the UI logic to interact with the chatbot (messages, text input, etc.).
- `ai_service.dart`: Contains the code for interacting with Dialogflow's API. It initializes Dialogflow, sends requests, and handles responses.

---

## Troubleshooting

If you encounter issues while running the app, here are some common problems and solutions:

1. **API Key/Service Account Errors**:
   - Ensure you have placed your `service-account.json` in the correct location (e.g., `assets/`).
   - Verify the credentials are valid and have the necessary permissions to interact with Dialogflow.

2. **Dependency Issues**:
   - Run `flutter clean` and then `flutter pub get` to reset the dependencies.

3. **Dialogflow Response Issues**:
   - Make sure your Dialogflow agent is trained and deployed correctly. You can test the agent in the Dialogflow console before integrating it with your Flutter app.

4. **Missing Fulfillment Text**:
   - Ensure your Dialogflow intents are properly configured and have response texts.

5. **Connection Timeout**:
   - Check your internet connection, as the app needs an active connection to communicate with the Dialogflow API.

---

## License

This project is licensed under the MIT License - see the LICENSE file for details.
```