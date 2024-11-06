// // ignore: file_names
// // ignore_for_file: prefer_interpolation_to_compose_strings
//
// import 'dart:developer';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:task_talk/Database/firebase.dart';
// import 'package:task_talk/models/reminder_model.dart';
// import 'package:task_talk/models/reoccurin_reminder_model.dart';
// import 'package:task_talk/view/home/set_reminder/set_reminder_viewModel.dart';
// import 'package:task_talk/view/splash_screen/splash_screen.dart';
//
// import '../../../Services/OPENAI/ReoccringModel.dart';
// import '../../../Services/notification_services.dart';
// import '../../custom/flutter_toast/flutter_toast.dart';
//
// class ReoccringViewmodel with ChangeNotifier {
//   String recurringEventText = '';
//   bool timeselectedForReminder = false;
//   String reminderType = "";
//   List days = [];
//   int? dayindex;
//   bool isLoading = false;
//   // bool isListening2 = false;
//   // late stt.SpeechToText speech;
//   String voiceText = '';
//   TextEditingController recurringEventController = TextEditingController();
//   TextEditingController recurringDateController = TextEditingController();
//   TextEditingController recurringMonthlyTimeController =
//       TextEditingController();
//   TextEditingController recurringYearlyTimeController = TextEditingController();
//   TextEditingController recurringTimeController = TextEditingController();
//   TextEditingController recurringReminderTimeController =
//       TextEditingController();
//   void clearController() {
//     days.clear();
//     recurringEventController.clear();
//     recurringDateController.clear();
//     recurringMonthlyTimeController.clear();
//     recurringYearlyTimeController.clear();
//     recurringTimeController.clear();
//     recurringReminderTimeController.clear();
//   }
//
//   // Future<void> initializeSpeechRecognizer() async {
//   //   speech = stt.SpeechToText(); // Initialize the speech recognizer
//   //   if(speech.isAvailable){
//   //     log('Speech recognizer initialized successfully.');
//   //   } else {
//   //     await speech.initialize(
//   //        finalTimeout: Duration(minutes: 5),
//   //     onStatus: (val) => onSpeechStatus(val), // Status listener
//   //     onError: (val) => print('Error: $val'), // Error handler
//   //   );
//   //   }
//   // }
//
//   // Function to handle speech status changes
//   // void onSpeechStatus(String status) {
//   //   if (status == 'listening') {
//   //     log("hppp true");
//   //     isListening2 = true; // When the app starts listening
//   //   } else {
//   //     isListening2 = false;
//   //     log("hppp flase"); // When the app stops listening
//   //   }
//   //   notifyListeners();
//   // }
//
//   void listen(BuildContext context) async {
//     bool permission = await NotificationService().showPermissionDialogForMicroPhone(context);
// var provider=Provider.of<SetReminderViewmodel>(context, listen: false);
//     if (!permission) {
//       showToast(context, "Please enable microphone permissions");
//
//       return;
//     }
//    await provider.initializeSpeechRecognizer();
//     log('inside listen');
//     if (!provider.isListening) {
//       log('is=nside listening');
//            bool available =provider. speech.isAvailable;
//       log('Speech recognition availability: $available');
//       if (available) {
//         log('You can speak now');
//
//        provider. speech.listen(onResult: (val) async {
//           voiceText = val.recognizedWords;
//
//           Map<String, dynamic> extractedFields =
//               await extractReminderDetails(voiceText);
//           log(voiceText);
//
//           if (extractedFields['event'] != "null") {
//             recurringEventController.text = extractedFields['event']!;
//           }
//
//           if (extractedFields['date'] != "null") {
//             recurringDateController.text = extractedFields['date']!;
//           }
//
//           if (extractedFields['time'] != "null") {
//             recurringTimeController.text = extractedFields['time']!;
//           }
//
//           if (extractedFields['reminderTime'] != "null") {
//             recurringReminderTimeController.text =
//                 extractedFields['reminderTime']!;
//           }
//
//           if (extractedFields['frequency'] != "null") {
//             reminderType = extractedFields['frequency']!;
//             setReminderType(reminderType);
//           }
//
//           if (extractedFields['frequency'] == "Monthly") {
//             recurringMonthlyTimeController.text = extractedFields['date']!;
//             selectTimeForReminder();
//           }
//
//           if (extractedFields['frequency'] == "Yearly") {
//             log("Frequencyyyyy" + extractedFields['frequency']!);
//             recurringYearlyTimeController.text = extractedFields['date']!;
//             selectTimeForReminder();
//           }
//
//           if (extractedFields['daysOfWeek'] != "null") {
//             days = extractedFields['daysOfWeek']! as List;
//             selectTimeForReminder();
//           }
//         });
//
//         // notifyListeners();
//       }
//     } else {
//    Provider.of<SetReminderViewmodel>(context, listen: true).isListening = false;
//       provider.speech.stop();
//       notifyListeners();
//     }
//
//     notifyListeners();
//   }
//
//   addDays(int day) {
//     if (days.contains(day)) {
//       days.remove(day);
//     } else {
//       days.add(day);
//     }
//     notifyListeners();
//   }
//
//   setReminderType(String type) {
//     if (type == "weekly" || type == "Week ") {
//       recurringMonthlyTimeController.clear();
//       recurringYearlyTimeController.clear();
//     }
//     if (type == "Monthly" || type == "monthly") {
//       days.clear();
//       recurringYearlyTimeController.clear();
//     }
//     if (type == "Yearly" || type == "yearly") {
//       days.clear();
//       recurringMonthlyTimeController.clear();
//     }
//     reminderType = type;
//     notifyListeners();
//   }
//
//   notifyListner() {
//     notifyListeners();
//   }
//
//   bool isTextNotEmpty() {
//     if (recurringEventController.text.isNotEmpty &&
//         recurringMonthlyTimeController.text.isNotEmpty &&
//         recurringYearlyTimeController.text.isNotEmpty &&
//         recurringTimeController.text.isNotEmpty) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   void getRecurringEventText(String value) {
//     recurringEventText = value;
//     notifyListeners();
//   }
//
//   void selectTimeForReminder() {
//     // dayindex = index;
//     timeselectedForReminder = true;
//     notifyListeners();
//   }
//
//   void changeLoadingState() {
//     isLoading = !isLoading;
//     notifyListeners();
//   }
//
//   Future<void> setreminder(
//       String date,
//       String eventName,
//       String reminderTime,
//       String reminderDate,
//       String time,
//       List weeklyDays,
//       String reminderType,
//       String eventDate,
//
//       ) async {
//     changeLoadingState();
//     ReoccuringReminderModel reminder = ReoccuringReminderModel(
//         called: false,
//         type: "reoccuring",
//         date: date,
//         eventDate: eventDate,
//         eventName: eventName,
//         fcmToken: token!,
//         reminderTime: reminderTime,
//         time: time,
//         reminderDate: reminderDate,
//         weeklyDays: weeklyDays,
//         reminderType: reminderType);
//
//     await FirebaseServices().addReoccuringReminder(reminder);
//     clearController();
//     changeLoadingState();
//   }
// }
//
// void printReminderDetails(Map<String, dynamic> details) {
//   print('--- Reminder Details ---');
//
//   // Print Event
//   String event = details['event'] ?? 'Not provided';
//   print('Event: $event');
//
//   // Print Date
//   String date = details['date'] ?? 'Not provided';
//   print('Date: $date');
//
//   // Print Time
//   String time = details['time'] ?? 'Not provided';
//   print('Time: $time');
//
//   // Print Reminder Time
//   String reminderTime = details['reminderTime'] ?? 'Not provided';
//   print('Reminder Time: $reminderTime');
//
//   // Print Frequency
//   String frequency = details['frequency'] ?? 'Not provided';
//   print('Frequency: $frequency');
//
//   String daysOfWeek = details['daysOfWeek'].toString() ?? 'Not provided';
//   print('daysOfWeek: ${daysOfWeek.toString()}');
//
//   // // Print Days of the Week if Frequency is Weekly
//   // if (frequency == 'weekly') {
//   //   List<String>? daysOfWeek = details['daysOfWeek'];
//   //   if (daysOfWeek != null && daysOfWeek.isNotEmpty) {
//   //     print('daysOfWeek: ${daysOfWeek.join(', ')}');
//   //   } else {
//   //     print('Days of the Week: Not provided');
//   //   }
//   // } else {
//   //   print('daysOfWeek: N/A');
//   // }
//
//   print('------------------------');
// }
