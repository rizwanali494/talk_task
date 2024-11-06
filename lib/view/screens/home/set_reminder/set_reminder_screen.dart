// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:task_talk/Services/notification_services.dart';
// import 'package:task_talk/config/constant/asset.dart';
// import 'package:task_talk/config/constant/color.dart';
// import 'package:task_talk/config/routes/routes_name.dart';
// import 'package:task_talk/view/Edit%20Event/eidt_event_view.dart';
//
// import 'package:task_talk/view/custom/custom_text/custom_text.dart';
// import 'package:task_talk/view/custom/date_time_picker/date_time_picker.dart';
// import 'package:task_talk/view/custom/flutter_toast/flutter_toast.dart';
// import 'package:task_talk/view/home/set_reminder/set_reminder_viewModel.dart';
// import 'package:task_talk/view/splash_screen/splash_screen.dart';
//
// // Add this line
// import 'package:lottie/lottie.dart';
//
// class SetReminderScreen extends StatefulWidget {
//   const SetReminderScreen({super.key});
//
//   @override
//   State<SetReminderScreen> createState() => _SetReminderScreenState();
// }
//
// class _SetReminderScreenState extends State<SetReminderScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final FocusNode _eventFocusNode = FocusNode();
//   // Add this line
//
//   @override
//   void initState() {
//
//     super.initState();
//     // Initialize SpeechToText
//     // Initialize the speech recognition
//   }
//
//   @override
//   void dispose() {
//     _eventFocusNode.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _eventFocusNode.unfocus();
//       },
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Consumer<SetReminderViewmodel>(builder: (context, model, child) {
//               return Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.r),
//                     border: Border.all(color: borderColor1)),
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
//                   child: Column(
//                     children: [
//                       /// ------> Add Task Section
//
//                       CustomText(
//                         text: 'Add Task',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.sp,
//                       ),
//                       // SizedBox(height: 5.h),
//                       GestureDetector(
//                           onTap: () {
//                             model.listen(context);
//                           },
//                           child: Image.asset(
//                             Asset.addTaskIcon,
//                             width: 157.w,
//                             height: 157.h,
//                             color: model.isListening ? redColor : primaryColor,
//                           )),
//
//                       CustomTextField(
//                         labelText: 'Event:',
//                         type: 0,
//                         reminderType: "",
//                         focusNode: _eventFocusNode,
//                         readOnly: false,
//                         controller: model.eventController,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter event';
//                           }
//                           return null;
//                         },
//                         onChanged: (val) {
//                           model.getEventText(val);
//                         },
//                       ),
//                       CustomTextField(
//                         labelText: 'Date:',
//                         type: 1,
//                         readOnly: true,
//                         controller: model.dateController,
//                         reminderType: "",
//                       ),
//                       CustomTextField(
//                         labelText: 'Event Time:',
//                         type: 2,
//                         readOnly: true,
//                         reminderType: "",
//                         controller: model.timeController,
//                       ),
//                       CustomTextField(
//                         labelText: 'Reminder Time:',
//                         type: 3,
//                         readOnly: true,
//                         reminderType: "",
//                         controller: model.reminderTimeController,
//                       ),
//                       SizedBox(height: 5.h),
//                       if (!model.isLoading)
//                         ElevatedButton(
//                             onPressed: () async {
//                               // NotificationService notificationservice =
//                               //     NotificationService();
//
//                               // Future<bool> permissionGranted =
//                               //     notificationservice
//                               //         .requestMotificationPermission();
//
//                               //         if(permissionGranted == false){
//                               //           showToast(context, "Kindly enable notification permission to continue");
//                               //         }else
//
//                               if (model.eventController.text.isEmpty ||
//                                   model.eventController.text == "null") {
//                                 showToast(context, "Kindly enter event name.");
//                               } else if (model.dateController.text.isEmpty ||
//                                   model.dateController.text == "null") {
//                                 showToast(context, "Kindly enter the date.");
//                               } else if (model.timeController.text.isEmpty ||
//                                   model.timeController.text == "null") {
//                                 showToast(context, "Kindly enter the time.");
//                               } else if (model
//                                       .reminderTimeController.text.isEmpty ||
//                                   model.reminderTimeController.text == "null") {
//                                 showToast(
//                                     context, "Kindly enter reminder time.");
//                               } else {
//                                 String reminderTimeString =
//                                     model.reminderTimeController.text;
//
//                                 String eventTimeString =
//                                     model.timeController.text;
//
//                                 DateTime? reminderParsedTime;
//                                 DateTime? eventParsedTime;
//
//                                 try {
//                                   DateFormat timeFormat = DateFormat("hh:mm a");
//
//                                   reminderParsedTime =
//                                       timeFormat.parse(reminderTimeString);
//                                   eventParsedTime =
//                                       timeFormat.parse(eventTimeString);
//                                 } catch (e) {
//                                   print(e);
//                                 }
//                                 try {
//                                   DateFormat timeFormat = DateFormat.jm();
//
//                                   reminderParsedTime =
//                                       timeFormat.parse(reminderTimeString);
//                                   eventParsedTime =
//                                       timeFormat.parse(eventTimeString);
//                                 } catch (e) {
//                                   print(e);
//                                 }
//
//                                 DateTime? reminderDate;
//                                 reminderDate =
//                                     DateTime.parse(model.dateController.text);
//
//                                 DateTime combinedEventDate = DateTime(
//                                   reminderDate.year,
//                                   reminderDate.month,
//                                   reminderDate.day,
//                                   eventParsedTime!.hour,
//                                   eventParsedTime.minute,
//                                 );
//
//                                 DateTime combinedReminderDate = DateTime(
//                                   reminderDate.year,
//                                   reminderDate.month,
//                                   reminderDate.day,
//                                   reminderParsedTime!.hour,
//                                   reminderParsedTime.minute,
//                                 );
//
//                                 if (reminderParsedTime
//                                     .isAfter(eventParsedTime)) {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return AlertDialog(
//                                         title: Text(
//                                           "Warning!",
//                                           style: TextStyle(
//                                               color:
//                                                   Colors.red.withOpacity(0.6)),
//                                         ),
//                                         content: Text(
//                                           "The reminder is placed after the time of the event.",
//                                           style: TextStyle(
//                                               color: Colors.black
//                                                   .withOpacity(0.6)),
//                                         ),
//                                         actions: [
//                                           // "Go back" button with white background and blue border
//                                           OutlinedButton(
//                                             onPressed: () {
//                                               Navigator.of(context)
//                                                   .pop(); // Close the dialog and go back
//                                             },
//                                             style: OutlinedButton.styleFrom(
//                                               side: BorderSide(
//                                                   color: Colors
//                                                       .blue), // Blue border
//                                               foregroundColor: Colors
//                                                   .blue, // Blue text color
//                                             ),
//                                             child: Text("Go back"),
//                                           ),
//
//                                           // "Confirm" button with blue background and white text
//                                           ElevatedButton(
//                                             onPressed: () async {
//                                               bool permissionNotification =
//                                                   await NotificationService()
//                                                       .showPermissionDialogForNotification(
//                                                           context);
//
//                                               bool permissionPhone =
//                                                   await NotificationService()
//                                                       .showPermissionDialogForPhone(
//                                                           context);
//
//                                               bool permissionSystemWindow =
//                                                   await NotificationService()
//                                                       .showPermissionDialogForSystemAlertWindow(
//                                                           context);
//
//                                               // bool permissionSystemWindow =
//                                               //     await NotificationService()
//                                               //         .showPermissionDialogForSystemAlertWindow(
//                                               //             context);
//
//                                               if (!permissionNotification &&
//                                                   !permissionPhone &&
//                                                   !permissionSystemWindow) {
//                                                 showToast(context,
//                                                     "Please enable microphone permissions");
//                                               } else if (combinedReminderDate
//                                                   .isBefore(DateTime.now())) {
//                                                 showToast(context,
//                                                     "Please select an upcoming date for your event");
//                                               } else {
//                                                 model.setreminder(
//                                                   combinedReminderDate
//                                                       .toString(),
//                                                   model.eventController.text,
//                                                   model.reminderTimeController
//                                                       .text,
//                                                   model.timeController.text,
//                                                   model.dateController.text,
//                                                   combinedEventDate.toString(),
//                                                 );
//                                                 Navigator.pop(context);
//                                               }
//                                               // Close the dialog after confirming
//                                               // Add any action here after confirmation
//                                             },
//                                             style: ElevatedButton.styleFrom(
//                                               backgroundColor: Colors
//                                                   .blue, // Blue background color
//                                               foregroundColor: Colors
//                                                   .white, // White text color
//                                             ),
//                                             child: Text("Confirm"),
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                   );
//                                 } else {
//                                   bool permissionNotification =
//                                       await NotificationService()
//                                           .showPermissionDialogForNotification(
//                                               context);
//
//                                   bool permissionPhone =
//                                       await NotificationService()
//                                           .showPermissionDialogForPhone(
//                                               context);
//
//                                   // bool permissionSystemWindow =
//                                   //     await NotificationService()
//                                   //         .showPermissionDialogForSystemAlertWindow(
//                                   //             context);
//
//                                   if (!permissionNotification &&
//                                           !permissionPhone
//
//                                       // &&
//                                       // !permissionSystemWindow
//
//                                       ) {
//                                     showToast(context,
//                                         "Please enable microphone permissions");
//                                   } else {
//                                     if (combinedReminderDate
//                                         .isBefore(DateTime.now())) {
//                                       showToast(context,
//                                           "Please select an upcoming date for your event");
//                                     } else {
//                                       model.setreminder(
//                                         combinedReminderDate.toString(),
//                                         model.eventController.text,
//                                         model.reminderTimeController.text,
//                                         model.timeController.text,
//                                         model.dateController.text,
//                                         combinedEventDate.toString(),
//                                       );
//                                     }
//                                   }
//                                 }
//                               }
//                             },
//                             style: ButtonStyle(
//                               backgroundColor: WidgetStateProperty.all<Color>(
//                                   model.eventController.text.isNotEmpty &&
//                                           model
//                                               .dateController.text.isNotEmpty &&
//                                           model
//                                               .timeController.text.isNotEmpty &&
//                                           model.reminderTimeController.text
//                                               .isNotEmpty
//                                       ? buttonColor
//                                       : dakgreyColor),
//                               minimumSize: WidgetStateProperty.all<Size>(
//                                   Size(327.w, 50.h)),
//                               shape: WidgetStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(16.r))),
//                             ),
//                             child: CustomText(
//                               text: 'Add Event',
//                               fontSize: 24.sp,
//                               fontWeight: FontWeight.w500,
//                               color: whiteColor,
//                             )),
//                       if (model.isLoading)
//                         const SpinKitCircle(
//                           color: primaryColor,
//                           size: 50.0,
//                         ),
//                     ],
//                   ),
//                 ),
//               );
//             }),
//             SizedBox(height: 8.h),
//             Padding(
//               padding: EdgeInsets.only(left: 15.w),
//               child: CustomText(
//                 text: 'Upcoming Events',
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             SizedBox(height: 5.h),
//
//             StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection(
//                     'Reminders',
//                   )
//                   .where("fcmToken", isEqualTo: token)
//                   .where("type", isEqualTo: "onetime")
//                   .orderBy("date")
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return SizedBox(
//                     height: 150.h,
//                     width: 1.sw,
//                     child: const Center(
//                       child: SpinKitCircle(
//                         color: primaryColor,
//                         size: 50.0,
//                       ),
//                     ),
//                   );
//                 }
//
//                 if (snapshot.hasError) {
//                   return SizedBox(
//                       height: 100.h,
//                       width: 1.sw,
//                       child: Center(
//                           child: Text(
//                         'Error: ${snapshot.error}',
//                         style: TextStyle(fontSize: 14.sp, color: greyColor),
//                       )));
//                 }
//
//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return SizedBox(
//                       height: 100.h,
//                       width: 1.sw,
//                       child: Center(
//                           child: Text(
//                         'No events added yet',
//                         style: TextStyle(fontSize: 14.sp, color: greyColor),
//                       )));
//                 }
//
//                 // Retrieve the list of documents
//                 final List<DocumentSnapshot> documents = snapshot.data!.docs;
//
//                 return ListView.builder(
//                   itemCount: documents.length,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     final document = documents[index];
//                     final data = document.data() as Map<String, dynamic>?;
//
//                     if (data == null) {
//                       return const ListTile(title: Text('No data available'));
//                     }
//
//                     return Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.symmetric(vertical: 5.h),
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(16.r),
//                                 border: Border.all(color: borderColor1)),
//                             child: ListTile(
//                               title: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Row(children: [
//                                     CustomText(
//                                       text: 'Event: ',
//                                       fontSize: 19.sp,
//                                       fontWeight: FontWeight.w600,
//                                       color: textColor2,
//                                     ),
//                                     SizedBox(
//                                       width: 1.sh / 3.5,
//                                       child: CustomText(
//                                         text: document["eventName"],
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w500,
//                                         color: textColor2,
//                                       ),
//                                     ),
//                                   ]),
//                                 ],
//                               ),
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(children: [
//                                     CustomText(
//                                       text: 'Date: ',
//                                       fontSize: 19.sp,
//                                       fontWeight: FontWeight.w600,
//                                       color: textColor2,
//                                     ),
//                                     CustomText(
//                                       text: document["reminderDate"],
//                                       fontSize: 18.sp,
//                                       fontWeight: FontWeight.w500,
//                                       color: textColor2,
//                                     )
//                                   ]),
//                                   Row(children: [
//                                     CustomText(
//                                       text: 'Event Time: ',
//                                       fontSize: 19.sp,
//                                       fontWeight: FontWeight.w600,
//                                       color: textColor2,
//                                     ),
//                                     CustomText(
//                                       text: document["time"],
//                                       fontSize: 18.sp,
//                                       fontWeight: FontWeight.w500,
//                                       color: textColor2,
//                                     )
//                                   ]),
//                                   Row(children: [
//                                     CustomText(
//                                       text: 'Reminder Time: ',
//                                       fontSize: 19.sp,
//                                       fontWeight: FontWeight.w600,
//                                       color: textColor2,
//                                     ),
//                                     CustomText(
//                                       text: document["reminderTime"],
//                                       fontSize: 18.sp,
//                                       fontWeight: FontWeight.w500,
//                                       color: textColor2,
//                                     ),
//                                     Spacer(),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         GestureDetector(
//                                             onTap: () {
//                                               showDialog(
//                                                 context: context,
//                                                 builder:
//                                                     (BuildContext context) {
//                                                   return AlertDialog(
//                                                     title: Text(
//                                                       "Delete Reminder",
//                                                       style: TextStyle(
//                                                           color: Colors.red
//                                                               .withOpacity(
//                                                                   0.6)),
//                                                     ),
//                                                     content: Text(
//                                                       "Are you sure you want to delete this reminder?",
//                                                       style: TextStyle(
//                                                           color: Colors.black
//                                                               .withOpacity(
//                                                                   0.6)),
//                                                     ),
//                                                     actions: [
//                                                       // "Go back" button with white background and blue border
//                                                       OutlinedButton(
//                                                         onPressed: () {
//                                                           Navigator.of(context)
//                                                               .pop(); // Close the dialog and go back
//                                                         },
//                                                         style: OutlinedButton
//                                                             .styleFrom(
//                                                           side: BorderSide(
//                                                               color: Colors
//                                                                   .grey), // Blue border
//                                                           foregroundColor: Colors
//                                                               .grey, // Blue text color
//                                                         ),
//                                                         child: Text("Go back"),
//                                                       ),
//
//                                                       // "Confirm" button with blue background and white text
//                                                       ElevatedButton(
//                                                         onPressed: () {
//                                                           FirebaseFirestore
//                                                               .instance
//                                                               .collection(
//                                                                   'Reminders')
//                                                               .doc(document.id)
//                                                               .delete();
//                                                           Navigator.pop(
//                                                               context); // Close the dialog after confirming
//                                                           // Add any action here after confirmation
//                                                         },
//                                                         style: ElevatedButton
//                                                             .styleFrom(
//                                                           backgroundColor: Colors
//                                                               .red, // Blue background color
//                                                           foregroundColor: Colors
//                                                               .white, // White text color
//                                                         ),
//                                                         child: Text("Delete"),
//                                                       ),
//                                                     ],
//                                                   );
//                                                 },
//                                               );
//                                             },
//                                             child: Icon(Icons.delete,
//                                                 color: Colors.red
//                                                     .withOpacity(0.8))),
//                                         SizedBox(width: 10.w),
//                                         GestureDetector(
//                                             onTap: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           EditEventScreen(
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
//                                       ],
//                                     ),
//                                   ]),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//
//             // Column(
//             //   children: List.generate(5, (index) {
//             //     return Padding(
//             //       padding: const EdgeInsets.only(bottom: 9.0),
//             //       child: Container(
//             //         decoration: BoxDecoration(
//             //             borderRadius: BorderRadius.circular(16.r),
//             //             border: Border.all(color: borderColor1)),
//             //         child: ListTile(
//             //           title: Row(children: [
//             //             CustomText(
//             //               text: 'Event: ',
//             //               fontSize: 19.sp,
//             //               fontWeight: FontWeight.w600,
//             //               color: textColor2,
//             //             ),
//             //             CustomText(
//             //               text: 'Study',
//             //               fontSize: 18.sp,
//             //               fontWeight: FontWeight.w500,
//             //               color: textColor2,
//             //             )
//             //           ]),
//             //           subtitle: Column(
//             //             crossAxisAlignment: CrossAxisAlignment.start,
//             //             children: [
//             //               Row(children: [
//             //                 CustomText(
//             //                   text: 'Date: ',
//             //                   fontSize: 19.sp,
//             //                   fontWeight: FontWeight.w600,
//             //                   color: textColor2,
//             //                 ),
//             //                 CustomText(
//             //                   text: '12345',
//             //                   fontSize: 18.sp,
//             //                   fontWeight: FontWeight.w500,
//             //                   color: textColor2,
//             //                 )
//             //               ]),
//             //               Row(children: [
//             //                 CustomText(
//             //                   text: 'Time: ',
//             //                   fontSize: 19.sp,
//             //                   fontWeight: FontWeight.w600,
//             //                   color: textColor2,
//             //                 ),
//             //                 CustomText(
//             //                   text: '6789',
//             //                   fontSize: 18.sp,
//             //                   fontWeight: FontWeight.w500,
//             //                   color: textColor2,
//             //                 )
//             //               ]),
//             //               Row(children: [
//             //                 CustomText(
//             //                   text: 'Reminder Time: ',
//             //                   fontSize: 19.sp,
//             //                   fontWeight: FontWeight.w600,
//             //                   color: textColor2,
//             //                 ),
//             //                 CustomText(
//             //                   text: '12345',
//             //                   fontSize: 18.sp,
//             //                   fontWeight: FontWeight.w500,
//             //                   color: textColor2,
//             //                 )
//             //               ]),
//             //             ],
//             //           ),
//             //         ),
//             //       ),
//             //     );
//             //   }),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ReminderTimePOP extends StatelessWidget {
//   const ReminderTimePOP({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         height: 300.h,
//         width: 343.w,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
//         child: Column(
//           children: [
//             SizedBox(height: 26.h),
//             CustomText(
//               text: "Reminder Timer",
//               fontSize: 20.sp,
//               fontWeight: FontWeight.w600,
//             ),
//             SizedBox(height: 15.h),
//             CustomText(
//               text:
//                   "You did not add a reminder time. You will not receive a call. Press save to confirm.",
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w500,
//             ),
//             SizedBox(height: 40.h),
//             Row(
//               children: [
//                 Expanded(
//                   child: AppButton(
//                     buttonColor: dakgreyColor,
//                     text: 'Cancel',
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 10.w),
//                 Expanded(
//                   child: AppButton(
//                     buttonColor: buttonColor,
//                     text: 'Save',
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CustomTextField extends StatelessWidget {
//   final String labelText;
//   final int type;
//   final bool readOnly;
//   final String reminderType;
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final void Function(String)? onChanged;
//   final FocusNode? focusNode;
//
//   const CustomTextField({
//     super.key,
//     required this.labelText,
//     this.validator,
//     this.type = 0,
//     required this.reminderType,
//     this.readOnly = false,
//     required this.controller,
//     this.onChanged,
//     this.focusNode,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           labelText,
//           style: TextStyle(
//             fontSize: 17.sp,
//             fontWeight: FontWeight.w600,
//             color: textColor1,
//           ),
//         ),
//         SizedBox(height: 4.h),
//         SizedBox(
//           height: 45.h,
//           child: Stack(
//             children: [
//               TextFormField(
//                 focusNode: focusNode,
//                 validator: validator,
//                 onChanged: onChanged,
//                 controller: controller,
//                 style: GoogleFonts.poppins(fontSize: 16.sp, color: textColor1),
//                 cursorColor: textColor1,
//                 readOnly: readOnly,
//                 decoration: InputDecoration(
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16.r),
//                     borderSide: const BorderSide(color: borderColor1),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16.r),
//                     borderSide: const BorderSide(color: borderColor1),
//                   ),
//                   contentPadding: EdgeInsets.symmetric(
//                     vertical: 10.h,
//                     horizontal: 10.w,
//                   ),
//                 ),
//               ),
//               if (readOnly == true)
//                 GestureDetector(
//                   onTap: () async {
//                     if (type == 1) {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return showSetDateDialog(context, controller,
//                                 reminderType, DateTime.now());
//                           });
//                     } else if (type == 2 || type == 3) {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return showSetTimeDialog(context, controller);
//                           });
//                     }
//                   },
//                 )
//             ],
//           ),
//         ),
//         SizedBox(height: 5.h),
//       ],
//     );
//   }
// }
//
// class AppButton extends StatelessWidget {
//   const AppButton({
//     super.key,
//     this.buttonColor,
//     this.text,
//     this.width,
//     this.height,
//     this.onPressed,
//     this.radius,
//     this.fontColor,
//   });
//   final Color? buttonColor;
//   final String? text;
//   final double? width;
//   final double? height;
//   final VoidCallback? onPressed;
//   final double? radius;
//   final Color? fontColor;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: height ?? 52.h,
//         width: width ?? 140.w,
//         decoration: BoxDecoration(
//           color: buttonColor ?? buttonColor,
//           borderRadius: BorderRadius.circular(radius ?? 12.r),
//         ),
//         child: Center(
//           child: CustomText(
//             text: text ?? 'Save',
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w500,
//             color: fontColor ?? whiteColor,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // For animations
