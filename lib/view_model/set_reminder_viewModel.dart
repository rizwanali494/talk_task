// // ignore: file_names
// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
// import 'package:task_talk/Database/firebase.dart';
// import 'package:task_talk/Services/notification_services.dart';
// import 'package:task_talk/models/reminder_model.dart';
// import 'package:task_talk/view/custom/flutter_toast/flutter_toast.dart';
// import 'package:task_talk/view/splash_screen/splash_screen.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
//
// import '../../../Services/openAi.dart';
//
// class SetReminderViewmodel with ChangeNotifier {
//   String eventText = '';
//
//   bool isLoading = false;
//   bool isListening = false;
//   late stt.SpeechToText speech;
//   String voiceText = '';
//   TextEditingController eventController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   TextEditingController timeController = TextEditingController();
//   TextEditingController reminderTimeController = TextEditingController();
//   void clearController() {
//     eventController = TextEditingController();
//     dateController = TextEditingController();
//     timeController = TextEditingController();
//     reminderTimeController = TextEditingController();
//
//     notifyListeners();
//   }
//
//   Future<void> initializeSpeechRecognizer() async {
//     speech = stt.SpeechToText(); // Initialize the speech recognizer
//     if (speech.isAvailable) {
//       log('Speech recognizer initialized successfully.');
//     } else {
//       await speech.initialize(
//         onStatus: (val) => onSpeechStatus(val), // Status listener
//         onError: (val) => print('Error: $val'), // Error handler
//       );
//     }
//   }
//
//   // Function to handle speech status changes
//   void onSpeechStatus(String status) {
//     if (status == 'listening') {
//       log("status: Listening");
//       isListening = true; // When the app starts listening
//     } else {
//       log("status: NotListening");
//
//       isListening = false; // When the app stops listening
//     }
//     notifyListeners();
//   }
//
//   void listen(BuildContext context) async {
//     bool permission =
//         await NotificationService().showPermissionDialogForMicroPhone(context);
//
//     if (!permission) {
//       showToast(context, "Please enable microphone permissions");
//
//       return;
//     }
//     await initializeSpeechRecognizer();
//
//     if (!isListening) {
//       log('inside listening');
//       bool available = speech.isAvailable;
//       log('Speech recognition availability: $available');
//       if (available) {
//         log('You can speak now');
//         speech.listen(
//             // Set maximum duration for listening
//             pauseFor: Duration(seconds: 60),
//             onResult: (val) async {
//               voiceText = val.recognizedWords;
//               // Update the event text based on recognized voice input
//               Map<String, String?> extractedFields =
//                   await extractFieldsUsingGPT(voiceText);
//
//               if (extractedFields['event'] != "null") {
//                 eventController.text = extractedFields['event']!;
//               }
//
//               if (extractedFields['date'] != "null") {
//                 dateController.text = extractedFields['date']!;
//               }
//
//               if (extractedFields['time'] != "null") {
//                 timeController.text = extractedFields['time']!;
//               }
//
//               if (extractedFields['reminderTime'] != "null") {
//                 reminderTimeController.text = extractedFields['reminderTime']!;
//               }
//
//               notifyListeners();
//             });
//
//         notifyListeners();
//       }
//     } else {
//       isListening = false;
//       speech.stop();
//       notifyListeners();
//     }
//
//     notifyListeners();
//   }
//
//   void getEventText(String value) {
//     eventText = value;
//     notifyListeners();
//   }
//
//   void changeLoadingState() {
//     isLoading = !isLoading;
//     notifyListeners();
//   }
//
//   Future<void> setreminder(String date, String eventName, String reminderTime,
//       String time, String reminderDate, String eventDate) async {
//     changeLoadingState();
//     ReminderModel reminder = ReminderModel(
//         called: false,
//         type: "onetime",
//         eventDate: eventDate,
//         reminderDate: reminderDate,
//         date: date,
//         eventName: eventName,
//         fcmToken: token!,
//         reminderTime: reminderTime,
//         time: time);
//
//     await FirebaseServices().addReminder(reminder);
//     clearController();
//     changeLoadingState();
//   }
//
//   Future<void> updateReminders() async {
//     changeLoadingState();
//   }
// }
