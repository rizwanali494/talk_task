// import 'dart:math';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:task_talk/Services/notification_services.dart';
// import 'package:task_talk/config/constant/asset.dart';
// import 'package:task_talk/config/constant/color.dart';
// import 'package:task_talk/view/custom/custom_text/custom_text.dart';
// import 'package:task_talk/view/home/reoccuring_reminder/reoccring_viewModel.dart';
// import 'package:task_talk/view/home/set_reminder/set_reminder_screen.dart';
// import 'package:task_talk/view/home/set_reminder/set_reminder_viewModel.dart';
//
// import '../../Edit Event/eidt_event_view.dart' as a;
// import '../../custom/flutter_toast/flutter_toast.dart';
// import '../../splash_screen/splash_screen.dart';
//
// class ReoccuringReminderScreen extends StatefulWidget {
//   const ReoccuringReminderScreen({super.key});
//
//   @override
//   State<ReoccuringReminderScreen> createState() =>
//       _ReoccuringReminderScreenState();
// }
//
// class _ReoccuringReminderScreenState extends State<ReoccuringReminderScreen> {
//   List<String> days = ['M', 'Tu', 'W', 'Th', 'F', 'Sa', 'Su'];
//   final FocusNode _eventFocusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize SpeechToText
//     // Initialize the speech recognition
//     print("Hiiii inside init");
//     // Provider.of<ReoccringViewmodel>(context, listen: false)
//     //     .initializeSpeechRecognizer();
//   }
//
//   @override
//   void dispose() {
//     _eventFocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _eventFocusNode.unfocus();
//       },
//       child: SizedBox(
//         height: 1.sh,
//         width: 1.sw,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Consumer<ReoccringViewmodel>(builder: (context, model, child) {
//                 return Container(
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16.r),
//                       border: Border.all(color: borderColor1)),
//                   child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//                     child: Column(
//                       children: [
//                         /// ------> Add Task Section
//
//                         CustomText(
//                           text: 'Add Task',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20.sp,
//                         ),
//
//                         GestureDetector(
//                             onTap: () {
//                               model.listen(context);
//                             },
//                             child: Image.asset(
//                               Asset.addTaskIcon,
//                               width: 157.w,
//                               height: 157.h,
//                               color: Provider.of<SetReminderViewmodel>(context,
//                                           listen: true)
//                                       .isListening
//                                   ? redColor
//                                   : primaryColor,
//                             )),
//                         CustomTextField(
//                           labelText: 'Event:',
//                           type: 0,
//                           readOnly: false,
//                           focusNode: _eventFocusNode,
//                           reminderType: "",
//                           controller: model.recurringEventController,
//                           onChanged: (val) {
//                             model.getRecurringEventText(val);
//                           },
//                         ),
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: CustomText(
//                             text: 'Daily/Weekly Reminders:',
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w600,
//                             color: textColor1,
//                           ),
//                         ),
//                         SizedBox(height: 6.h),
//                         FittedBox(
//                           child: Row(
//                             children: List.generate(7, (index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   model.addDays(index + 1);
//                                   model.selectTimeForReminder();
//                                   model.setReminderType("weekly");
//                                 },
//                                 child: Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 3.w),
//                                   child: Container(
//                                     height: 52.h,
//                                     width: 52.w,
//                                     decoration: BoxDecoration(
//                                       color: model.days.contains(index + 1)
//                                           ? buttonColor
//                                           : primaryColor.withOpacity(0.2),
//                                       shape: BoxShape.circle,
//                                       border: Border.all(color: primaryColor),
//                                     ),
//                                     child: Center(
//                                         child: CustomText(
//                                       text: days[index],
//                                       fontSize: 14.sp,
//                                       color: model.days.contains(index + 1)
//                                           ? whiteColor
//                                           : blackColor,
//                                     )),
//                                   ),
//                                 ),
//                               );
//                             }),
//                           ),
//                         ),
//                         SizedBox(height: 8.h),
//                         // CustomTextField(
//                         //   labelText: 'Yearly Reminders:',
//                         //   type: 1,
//                         //   readOnly: true,
//                         //   controller: dateController,
//                         // ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: CustomTextField(
//                                 labelText: 'Monthly Reminders:',
//                                 type: 1,
//                                 reminderType: "Monthly",
//                                 readOnly: true,
//                                 controller:
//                                     model.recurringMonthlyTimeController,
//                               ),
//                             ),
//                             SizedBox(width: 10.w),
//                             Expanded(
//                               child: CustomTextField(
//                                 labelText: 'Yearly Reminders:',
//                                 type: 1,
//                                 reminderType: "Yearly",
//                                 readOnly: true,
//                                 controller: model.recurringYearlyTimeController,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: CustomTextField(
//                                 labelText: 'Event Time:',
//                                 type: 2,
//                                 reminderType: "",
//                                 readOnly: true,
//                                 controller: model.recurringTimeController,
//                               ),
//                             ),
//                             SizedBox(width: 10.w),
//                             Expanded(
//                               child: CustomTextField(
//                                 labelText: 'Reminder Time:',
//                                 reminderType: "",
//                                 type: 3,
//                                 readOnly: true,
//                                 controller:
//                                     model.recurringReminderTimeController,
//                               ),
//                             ),
//                           ],
//                         ),
//                         // CustomTextField(
//                         //   labelText: 'Time:',
//                         //   type: 2,
//                         //   readOnly: true,
//                         //   controller: timeController,
//                         // ),
//                         // CustomTextField(
//                         //   labelText: 'Reminder Time:',
//                         //   type: 3,
//                         //   readOnly: true,
//                         //   controller: reminderTimeController,
//                         // ),
//
//                         if (model.isLoading)
//                           const SpinKitCircle(
//                             color: primaryColor,
//                             size: 50.0,
//                           ),
//
//                         if (!model.isLoading)
//                           ElevatedButton(
//                               onPressed: () async {
//                                 // NotificationService notificationservice =
//                                 //     NotificationService();
//
//                                 // Future<bool> permissionGranted =
//                                 //     notificationservice
//                                 //         .requestMotificationPermission();
//
//                                 // if (permissionGranted == false) {
//                                 //   showToast(context,
//                                 //       "Kindly enable notification permission to continue");
//                                 // } else
//
//                                 if (model.recurringEventController.text
//                                         .isEmpty ||
//                                     model.recurringEventController.text ==
//                                         "null") {
//                                   showToast(
//                                       context, "Kindly enter event name.");
//                                 } else if (model.timeselectedForReminder ==
//                                     false) {
//                                   showToast(context,
//                                       "Kindly select at least one option in daily , montlhy and yearly reminders.");
//                                 } else if (model
//                                         .recurringTimeController.text.isEmpty ||
//                                     model.recurringTimeController.text ==
//                                         "null") {
//                                   showToast(context, "Kindly enter the time.");
//                                 } else if (model.recurringReminderTimeController
//                                         .text.isEmpty ||
//                                     model.recurringReminderTimeController
//                                             .text ==
//                                         "null") {
//                                   showToast(
//                                       context, "Kindly enter reminder time.");
//                                 } else {
//                                   String reminderTimeString = model
//                                       .recurringReminderTimeController.text;
//
//                                   String eventTimeString =
//                                       model.recurringTimeController.text;
//
//                                   DateTime? reminderParsedTime;
//                                   DateTime? eventParsedTime;
//                                   try {
//                                     DateFormat timeFormat =
//                                         DateFormat("hh:mm a");
//
//                                     reminderParsedTime =
//                                         timeFormat.parse(reminderTimeString);
//                                     eventParsedTime =
//                                         timeFormat.parse(eventTimeString);
//                                   } catch (e) {
//                                     print(e);
//                                   }
//                                   try {
//                                     DateFormat timeFormat = DateFormat.jm();
//
//                                     reminderParsedTime =
//                                         timeFormat.parse(reminderTimeString);
//                                     eventParsedTime =
//                                         timeFormat.parse(eventTimeString);
//                                   } catch (e) {
//                                     print(e);
//                                   }
//
//                                   print(model.reminderType.toString());
//                                   DateTime? reminderDate;
//
//                                   if (model.reminderType == "weekly" ||
//                                       model.reminderType == "Weekly") {
//                                     DateTime now = DateTime.now();
//
//                                     // Initialize the next date as far in the future
//                                     DateTime? nextDate;
//
//                                     for (int weekday in model.days) {
//                                       // Calculate the difference between the current weekday and the target weekday
//                                       int daysToNext =
//                                           (weekday - now.weekday + 7) % 7;
//
//                                       // If the target weekday is today but the current time has passed, move to the next week
//                                       if (daysToNext == 0 &&
//                                           now.hour >= 23 &&
//                                           now.minute >= 59) {
//                                         daysToNext = 7;
//                                       }
//
//                                       // If the target weekday is today and the time hasn't passed, don't add extra days
//                                       if (daysToNext == 0 &&
//                                           now.hour < 23 &&
//                                           now.minute < 59) {
//                                         daysToNext = 0;
//                                       }
//
//                                       // Calculate the next occurrence of the weekday
//                                       DateTime possibleNextDate =
//                                           now.add(Duration(days: daysToNext));
//
//                                       // Update the next date if it's earlier than the current nextDate
//                                       if (nextDate == null ||
//                                           possibleNextDate.isBefore(nextDate)) {
//                                         nextDate = possibleNextDate;
//                                       }
//                                     }
//
//                                     reminderDate = nextDate;
//                                   } else if (model.reminderType == "Monthly" ||
//                                       model.reminderType == "monthly") {
//                                     print("in monthly");
//                                     reminderDate = DateTime.parse(model
//                                         .recurringMonthlyTimeController.text);
//                                   } else if (model.reminderType == "Yearly" ||
//                                       model.reminderType == "yearly") {
//                                     print("in yearly");
//                                     reminderDate = DateTime.parse(model
//                                         .recurringYearlyTimeController.text);
//                                   }
//
//                                   DateTime combinedReminderDate = DateTime(
//                                     reminderDate!.year,
//                                     reminderDate.month,
//                                     reminderDate.day,
//                                     reminderParsedTime!.hour,
//                                     reminderParsedTime.minute,
//                                   );
//
//                                   DateTime combinedEventDate = DateTime(
//                                     reminderDate.year,
//                                     reminderDate.month,
//                                     reminderDate.day,
//                                     eventParsedTime!.hour,
//                                     eventParsedTime.minute,
//                                   );
//
//                                   DateTime reminderDateTime = DateTime(
//                                     reminderDate.year,
//                                     reminderDate.month,
//                                     reminderDate.day,
//                                   );
//
//                                   if (reminderParsedTime
//                                       .isAfter(eventParsedTime!)) {
//                                     showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return AlertDialog(
//                                           title: Text(
//                                             "Warning!",
//                                             style: TextStyle(
//                                                 color: Colors.red
//                                                     .withOpacity(0.6)),
//                                           ),
//                                           content: Text(
//                                             "The reminder is placed after the time of the event.",
//                                             style: TextStyle(
//                                                 color: Colors.black
//                                                     .withOpacity(0.6)),
//                                           ),
//                                           actions: [
//                                             // "Go back" button with white background and blue border
//                                             OutlinedButton(
//                                               onPressed: () {
//                                                 Navigator.of(context)
//                                                     .pop(); // Close the dialog and go back
//                                               },
//                                               style: OutlinedButton.styleFrom(
//                                                 side: BorderSide(
//                                                     color: Colors
//                                                         .blue), // Blue border
//                                                 foregroundColor: Colors
//                                                     .blue, // Blue text color
//                                               ),
//                                               child: Text("Go back"),
//                                             ),
//
//                                             // "Confirm" button with blue background and white text
//                                             ElevatedButton(
//                                               onPressed: () async {
//                                                 bool permissionNotification =
//                                                     await NotificationService()
//                                                         .showPermissionDialogForNotification(
//                                                             context);
//
//                                                 bool permissionPhone =
//                                                     await NotificationService()
//                                                         .showPermissionDialogForPhone(
//                                                             context);
//
//                                                 // bool permissionSystemWindow =
//                                                 //     await NotificationService()
//                                                 //         .showPermissionDialogForSystemAlertWindow(
//                                                 //             context);
//
//                                                 if (!permissionNotification &&
//                                                         !permissionPhone
//
//                                                     //  &&
//                                                     // !permissionSystemWindow
//
//                                                     ) {
//                                                   showToast(context,
//                                                       "Please enable microphone permissions");
//                                                 } else if (combinedReminderDate
//                                                     .isBefore(DateTime.now())) {
//                                                   showToast(context,
//                                                       "Please select an upcoming date for your event");
//                                                 } else {
//                                                   model.setreminder(
//                                                       combinedReminderDate
//                                                           .toString(),
//                                                       model
//                                                           .recurringEventController
//                                                           .text,
//                                                       model
//                                                           .recurringReminderTimeController
//                                                           .text,
//                                                       reminderDateTime
//                                                           .toString()
//                                                           .split(" ")
//                                                           .first,
//                                                       model
//                                                           .recurringTimeController
//                                                           .text,
//                                                       model.days,
//                                                       model.reminderType,
//                                                       combinedEventDate
//                                                           .toString());
//                                                   Navigator.pop(context);
//                                                 }
//                                                 // Close the dialog after confirming
//                                                 // Add any action here after confirmation
//                                               },
//                                               style: ElevatedButton.styleFrom(
//                                                 backgroundColor: Colors
//                                                     .blue, // Blue background color
//                                                 foregroundColor: Colors
//                                                     .white, // White text color
//                                               ),
//                                               child: Text("Confirm"),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                   } else {
//                                     bool permissionNotification =
//                                         await NotificationService()
//                                             .showPermissionDialogForNotification(
//                                                 context);
//
//                                     bool permissionPhone =
//                                         await NotificationService()
//                                             .showPermissionDialogForPhone(
//                                                 context);
//
//                                     // bool permissionSystemWindow =
//                                     //     await NotificationService()
//                                     //         .showPermissionDialogForSystemAlertWindow(
//                                     //             context);
//
//                                     if (!permissionNotification &&
//                                             !permissionPhone
//
//                                         // &&
//                                         // !permissionSystemWindow
//
//                                         ) {
//                                       showToast(context,
//                                           "Please enable microphone permissions");
//                                     } else {
//                                       if (combinedReminderDate
//                                           .isBefore(DateTime.now())) {
//                                         showToast(context,
//                                             "Please select an upcoming date for your event");
//                                       } else {
//                                         model.setreminder(
//                                             combinedReminderDate.toString(),
//                                             model.recurringEventController.text,
//                                             model
//                                                 .recurringReminderTimeController
//                                                 .text,
//                                             reminderDateTime
//                                                 .toString()
//                                                 .split(" ")
//                                                 .first,
//                                             model.recurringTimeController.text,
//                                             model.days,
//                                             model.reminderType,
//                                             combinedEventDate.toString());
//                                       }
//                                     }
//                                   }
//                                 }
//                                 // if (model.recurringEventController.text.isNotEmpty &&
//                                 //     model
//                                 //         .recurringMonthlyTimeController.text.isNotEmpty &&
//                                 //     model.recurringYearlyTimeController.text.isNotEmpty &&
//                                 //     model.recurringTimeController.text.isNotEmpty) {
//                                 //   if (model
//                                 //       .recurringReminderTimeController.text.isNotEmpty) {
//                                 //   } else {
//                                 //     showDialog(
//                                 //         context: context,
//                                 //         builder: (BuildContext context) {
//                                 //           return const ReminderTimePOP();
//                                 //         });
//                                 //   }
//                                 // } else {}
//                               },
//                               style: ButtonStyle(
//                                 backgroundColor: WidgetStateProperty.all<Color>(
//                                     model.timeselectedForReminder &&
//                                             model.recurringEventController.text
//                                                 .isNotEmpty &&
//                                             model.recurringTimeController.text
//                                                 .isNotEmpty &&
//                                             model
//                                                 .recurringReminderTimeController
//                                                 .text
//                                                 .isNotEmpty
//                                         ? buttonColor
//                                         : dakgreyColor),
//                                 minimumSize: WidgetStateProperty.all<Size>(
//                                     Size(327.w, 50.h)),
//                                 shape: WidgetStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(16.r))),
//                               ),
//                               child: CustomText(
//                                 text: 'Add Event',
//                                 fontSize: 24.sp,
//                                 fontWeight: FontWeight.w500,
//                                 color: whiteColor,
//                               )),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//               SizedBox(height: 4.h),
//               Padding(
//                 padding: EdgeInsets.only(left: 15.w),
//                 child: CustomText(
//                   text: 'Reoccurring Events',
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               // SizedBox(height: 5.h),
//
//               StreamBuilder<QuerySnapshot>(
//                 stream: FirebaseFirestore.instance
//                     .collection(
//                       'Reminders',
//                     )
//                     .where("fcmToken", isEqualTo: token)
//                     .where("type", isEqualTo: "reoccuring")
//                     .orderBy("date")
//                     .snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return SizedBox(
//                       height: 150.h,
//                       width: 1.sw,
//                       child: const Center(
//                         child: SpinKitCircle(
//                           color: primaryColor,
//                           size: 50.0,
//                         ),
//                       ),
//                     );
//                   }
//
//                   if (snapshot.hasError) {
//                     return SizedBox(
//                         height: 100.h,
//                         width: 1.sw,
//                         child: Center(
//                             child: Text(
//                           'Error: ${snapshot.error}',
//                           style: TextStyle(fontSize: 14.sp, color: greyColor),
//                         )));
//                   }
//
//                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                     return SizedBox(
//                         height: 100.h,
//                         width: 1.sw,
//                         child: Center(
//                             child: Text(
//                           'No events added yet',
//                           style: TextStyle(fontSize: 14.sp, color: greyColor),
//                         )));
//                   }
//
//                   // Retrieve the list of documents
//                   final List<DocumentSnapshot> documents = snapshot.data!.docs;
//
//                   return ListView.builder(
//                     itemCount: documents.length,
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       final document = documents[index];
//                       final data = document.data() as Map<String, dynamic>?;
//
//                       if (data == null) {
//                         return const ListTile(title: Text('No data available'));
//                       }
//
//                       return Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(vertical: 5.h),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(16.r),
//                                   border: Border.all(color: borderColor1)),
//                               child: ListTile(
//                                 title: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     children: [
//                                       CustomText(
//                                         text: 'Event: ',
//                                         fontSize: 19.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: textColor2,
//                                       ),
//                                       SizedBox(
//                                         width: 1.sh / 4,
//                                         child: CustomText(
//                                           text: document["eventName"],
//                                           fontSize: 18.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: textColor2,
//                                         ),
//                                       )
//                                     ]),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(children: [
//                                       CustomText(
//                                         text: 'Date: ',
//                                         fontSize: 19.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: textColor2,
//                                       ),
//                                       CustomText(
//                                         text: document["date"].split(' ').first,
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w500,
//                                         color: textColor2,
//                                       )
//                                     ]),
//                                     Row(children: [
//                                       CustomText(
//                                         text: 'Event Time: ',
//                                         fontSize: 19.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: textColor2,
//                                       ),
//                                       CustomText(
//                                         text: document["time"],
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w500,
//                                         color: textColor2,
//                                       )
//                                     ]),
//                                     Row(children: [
//                                       CustomText(
//                                         text: 'Reminder Time: ',
//                                         fontSize: 19.sp,
//                                         fontWeight: FontWeight.w600,
//                                         color: textColor2,
//                                       ),
//                                       CustomText(
//                                         text: document["reminderTime"],
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w500,
//                                         color: textColor2,
//                                       ),
//                                       Spacer(),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           GestureDetector(
//                                               onTap: () {
//                                                 showDialog(
//                                                   context: context,
//                                                   builder:
//                                                       (BuildContext context) {
//                                                     return AlertDialog(
//                                                       title: Text(
//                                                         "Delete Reminder",
//                                                         style: TextStyle(
//                                                             color: Colors.red
//                                                                 .withOpacity(
//                                                                     0.6)),
//                                                       ),
//                                                       content: Text(
//                                                         "Are you sure you want to delete this reminder?",
//                                                         style: TextStyle(
//                                                             color: Colors.black
//                                                                 .withOpacity(
//                                                                     0.6)),
//                                                       ),
//                                                       actions: [
//                                                         // "Go back" button with white background and blue border
//                                                         OutlinedButton(
//                                                           onPressed: () {
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop(); // Close the dialog and go back
//                                                           },
//                                                           style: OutlinedButton
//                                                               .styleFrom(
//                                                             side: BorderSide(
//                                                                 color: Colors
//                                                                     .grey), // Blue border
//                                                             foregroundColor: Colors
//                                                                 .grey, // Blue text color
//                                                           ),
//                                                           child:
//                                                               Text("Go back"),
//                                                         ),
//
//                                                         // "Confirm" button with blue background and white text
//                                                         ElevatedButton(
//                                                           onPressed: () {
//                                                             FirebaseFirestore
//                                                                 .instance
//                                                                 .collection(
//                                                                     'Reminders')
//                                                                 .doc(
//                                                                     document.id)
//                                                                 .delete();
//                                                             Navigator.pop(
//                                                                 context); // Close the dialog after confirming
//                                                             // Add any action here after confirmation
//                                                           },
//                                                           style: ElevatedButton
//                                                               .styleFrom(
//                                                             backgroundColor: Colors
//                                                                 .red, // Blue background color
//                                                             foregroundColor: Colors
//                                                                 .white, // White text color
//                                                           ),
//                                                           child: Text("Delete"),
//                                                         ),
//                                                       ],
//                                                     );
//                                                   },
//                                                 );
//                                               },
//                                               child: Icon(Icons.delete,
//                                                   color: Colors.red
//                                                       .withOpacity(0.8))),
//                                           SizedBox(width: 10.w),
//                                                GestureDetector(
//                                             onTap: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           a.EditEventScreen(
//                                                               eventName: document[
//                                                                   "eventName"],
//                                                               eventDate: document[
//                                                                   "eventDate"],
//                                                               reminderTime: document[
//                                                                   "reminderTime"],
//                                                               eventTime:
//                                                                   document[
//                                                                       "time"],
//                                                               id: document
//                                                                   .id)));
//                                             },
//                                             child: Icon(Icons.edit,
//                                                 color: Colors.black)),
//                                         ],
//                                       ),
//                                     ]),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 200.h,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
