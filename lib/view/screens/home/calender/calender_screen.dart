// import 'dart:math';
//
// import 'package:calendar_view/calendar_view.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:task_talk/config/constant/color.dart';
// import 'package:task_talk/config/routes/routes_name.dart';
// import 'package:task_talk/view/custom/custom_text/custom_text.dart';
// import 'package:task_talk/view/customization_screen/customization_viewModel.dart';
// import 'package:task_talk/view/home/calender/calender_viewmodel.dart';
// import 'package:task_talk/view/home/home_model.dart';
// import 'package:task_talk/view/splash_screen/splash_screen.dart';
//
// import '../../Edit Event/eidt_event_view.dart';
//
// class CalenderScreen extends StatefulWidget {
//   const CalenderScreen({super.key});
//
//   @override
//   State<CalenderScreen> createState() => _CalenderScreenState();
// }
//
// class _CalenderScreenState extends State<CalenderScreen> {
//   Map<String, int> eventCountByDate = {};
//    final List<String> happyEmojis = [
//     '😀', '😃', '😄', '😁', '😆',
//     '😅', '😂', '😇', '🙂', '😊',
//     '😍', '🤗', '🥳', '😎', '😺',
//   ];
//      final random = Random();
//
//   // If not imported yet
//
//   final EventController eventController = EventController();
//   // Adding events to the controller
//   @override
//   void initState() {
//
//     var calendarProvider =
//         Provider.of<CalenderViewmodel>(context, listen: false);
//     calendarProvider.selectedDate = null;
//
//     fetchEvents();
//     setState(() {});
//     super.initState();
//   }
//
//   Future<void> fetchEvents() async {
//     QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection('Reminders')
//         .where("fcmToken", isEqualTo: token)
//         .get();
//
//     Map<String, int> eventCounts = {};
//
//     for (var doc in snapshot.docs) {
//       String formattedDate = doc['date'].split(' ').first;
//
//       if (eventCounts.containsKey(formattedDate)) {
//         eventCounts[formattedDate] = eventCounts[formattedDate]! + 1;
//       } else {
//         eventCounts[formattedDate] = 1;
//       }
//     }
//
//     setState(() {
//       eventCountByDate = eventCounts;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var calendarProvider = Provider.of<CalenderViewmodel>(context);
//     var customizationProvider = Provider.of<CustomizationViewmodel>(context);
//
//     Size size = MediaQuery.of(context).size;
//     double h = size.height;
//
//     return Consumer<HomeModel>(builder: (context, model, child) {
//       return model.isTask
//           ?
//
//           ///
//           ///  ------>  Enable
//           ///
//           Column(
//               children: [
//                 SizedBox(height: 27.h),
//                 Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: borderColor1,
//                     ),
//                     borderRadius: BorderRadius.circular(10.r),
//                   ),
//                   child: Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
//                     child: SizedBox(
//                       height: h * 0.4,
//                       child: SfCalendar(
//                         initialDisplayDate: DateTime.now(),
//                         view: CalendarView.month,
//                         cellBorderColor: Colors.transparent,
//                         firstDayOfWeek: 1,
//                         showNavigationArrow: true,
//                         onSelectionChanged: (calenderDetails) {
//                           calendarProvider.selectDate(calenderDetails.date!);
//                         },
//                         headerHeight: h * 0.07,
//                         viewHeaderHeight: h * 0.04,
//                         headerStyle: CalendarHeaderStyle(
//                           backgroundColor: Colors.transparent,
//                           textStyle: GoogleFonts.poppins(
//                             color: primaryColor,
//                             fontSize: h * 0.022,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         viewHeaderStyle: ViewHeaderStyle(
//                           dayTextStyle: GoogleFonts.poppins(
//                             color: blackColor,
//                             fontSize: h * 0.019,
//                             fontWeight: FontWeight.w500,
//                           ),
//                           dateTextStyle: GoogleFonts.poppins(
//                             color: primaryColor,
//                             fontSize: h * 0.015,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         monthCellBuilder:
//                             (BuildContext context, MonthCellDetails details) {
//                           // Define a list of dates and their corresponding colors
//
//                           final DateTime date = details.date;
//                           String formattedDate =
//                               DateFormat('yyyy-MM-dd').format(details.date);
//
//                           int eventCount = eventCountByDate[formattedDate] ?? 0;
//
//                           // Check if there are more than 3 events and change the background color to blue
//                           Color cellColor = eventCount == 1
//                               ? Color(customizationProvider.eventColor1)
//                               : eventCount == 2
//                                   ? Color(customizationProvider.eventColor2)
//                                   : eventCount == 0
//                                       ? Colors.transparent
//                                       : Color(
//                                           customizationProvider.eventColor3);
//
//                           return CircleAvatar(
//                             backgroundColor: cellColor,
//                             child: CustomText(
//                               text: date.day.toString(),
//                               color: eventCount != 0
//                                   ? Colors.white
//                                   : details.visibleDates[10].month ==
//                                           details.date.month
//                                       ? blackColor // Current month in black
//                                       : textColor1.withOpacity(0.7),
//                               fontWeight: FontWeight.w500,
//                               fontSize: h * 0.015,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 14.h),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 15.w),
//                     child: CustomText(
//                       text: 'Upcoming Events',
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection(
//                         'Reminders',
//                       )
//                       .where("fcmToken", isEqualTo: token)
//                       // .where("type", isEqualTo: "reoccuring")
//                       .orderBy("eventDate",descending: false)
//                       // .orderBy("time",descending: false)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return SizedBox(
//                         height: 150.h,
//                         width: 1.sw,
//                         child: const Center(
//                           child: SpinKitCircle(
//                             color: primaryColor,
//                             size: 50.0,
//                           ),
//                         ),
//                       );
//                     }
//
//                     if (snapshot.hasError) {
//                       return SizedBox(
//                           height: 100.h,
//                           width: 1.sw,
//                           child: Center(
//                               child: Text(
//                             'Error: ${snapshot.error}',
//                             style: TextStyle(fontSize: 14.sp, color: greyColor),
//                           )));
//                     }
//
//                     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                       return SizedBox(
//                           height: 100.h,
//                           width: 1.sw,
//                           child: Center(
//                               child: Text(
//                             'No events added yet',
//                             style: TextStyle(fontSize: 14.sp, color: greyColor),
//                           )));
//                     }
//
//                     // Retrieve the list of documents
//                     final List<DocumentSnapshot> documents =
//                         snapshot.data!.docs;
//
//                     return ListView.builder(
//                       itemCount: documents.length,
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         final document = documents[index];
//                         final data = document.data() as Map<String, dynamic>?;
//                         if (calendarProvider.selectedDate != null) {
//                           if (document["date"].split(' ').first !=
//                               calendarProvider.selectedDate) {
//                             return const SizedBox();
//                           }
//                         }
//
//                         if (data == null) {
//                           return const ListTile(
//                               title: Text('No data available'));
//                         }
//
//                         return Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(vertical: 5.h),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(16.r),
//                                     border: Border.all(color: borderColor1)),
//                                 child: ListTile(
//                                   title: Row(children: [
//                                     CustomText(
//                                       text: 'Event: ',
//                                       fontSize: 19.sp,
//                                       fontWeight: FontWeight.w600,
//                                       color: textColor2,
//                                     ),
//                                     SizedBox(
//                                       width: 1.sh / 4,
//                                       child: CustomText(
//                                         text: document["eventName"],
//                                         fontSize: 18.sp,
//                                         fontWeight: FontWeight.w500,
//                                         color: textColor2,
//                                       ),
//                                     )
//                                   ]),
//                                   subtitle: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(children: [
//                                         CustomText(
//                                           text: 'Date: ',
//                                           fontSize: 19.sp,
//                                           fontWeight: FontWeight.w600,
//                                           color: textColor2,
//                                         ),
//                                         document["type"] == "onetime"
//                                             ? CustomText(
//                                                 text: document["reminderDate"],
//                                                 fontSize: 18.sp,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: textColor2,
//                                               )
//                                             : CustomText(
//                                                 text: document["date"]
//                                                     .split(' ')
//                                                     .first,
//                                                 fontSize: 18.sp,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: textColor2,
//                                               )
//                                       ]),
//                                       Row(children: [
//                                         CustomText(
//                                           text: 'Event Time: ',
//                                           fontSize: 19.sp,
//                                           fontWeight: FontWeight.w600,
//                                           color: textColor2,
//                                         ),
//                                         CustomText(
//                                           text: document["time"],
//                                           fontSize: 18.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: textColor2,
//                                         )
//                                       ]),
//                                       Row(children: [
//                                         CustomText(
//                                           text: 'Reminder Time: ',
//                                           fontSize: 19.sp,
//                                           fontWeight: FontWeight.w600,
//                                           color: textColor2,
//                                         ),
//                                         CustomText(
//                                           text: document["reminderTime"],
//                                           fontSize: 18.sp,
//                                           fontWeight: FontWeight.w500,
//                                           color: textColor2,
//                                         ),
//                                          Spacer(),
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
//                                           GestureDetector(
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
//                                       ]),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ],
//             )
//           : Container(
//               color: Colors.white,
//               height: 1.sh,
//               width: 1.sw,
//               child: DayView(
//                 backgroundColor: Colors.transparent,
//                 headerStyle: HeaderStyle(
//                     headerTextStyle: const TextStyle(
//                         color: primaryColor, fontWeight: FontWeight.bold),
//                     decoration: BoxDecoration(
//                         color: Colors.transparent,
//                         border: Border.all(
//                           color: lightGreyColor,
//                         ),
//                         borderRadius: BorderRadius.circular(10.sp))),
//                 controller:
//                     eventController, // Assign the controller with events
//                 dateStringBuilder: (date, {DateTime? secondaryDate}) {
//                   return DateFormat('dd MMM yyyy').format(date).toString();
//                 },
//                 timeLineBuilder: (time) {
//                   return SizedBox.shrink(); // Remove the timeline
//                 },
//                 hourIndicatorSettings: HourIndicatorSettings(
//                   height: 0,
//                   color: Colors.transparent,
//                 ),
//
//                 dayDetectorBuilder: ({
//                   required DateTime date,
//                   required double height,
//                   required double heightPerMinute,
//                   required MinuteSlotSize minuteSlotSize,
//                   required double width,
//                 }) {
//
//                   return Padding(
//                     padding: EdgeInsets.only(top: 25.h),
//                     child: StreamBuilder<QuerySnapshot>(
//                       stream: FirebaseFirestore.instance
//                           .collection(
//                             'Reminders',
//                           )
//                           .where("fcmToken", isEqualTo: token)
//                           // .where("type", isEqualTo: "reoccuring")
//                           .orderBy("date")
//                           .orderBy("time")
//                           .snapshots(),
//                       builder: (context, snapshot) {
//
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                                    print("Hiii3");
//
//                           return SizedBox(
//                             height: 150.h,
//                             width: 1.sw,
//                             child: const Center(
//                               child: SpinKitCircle(
//                                 color: primaryColor,
//                                 size: 50.0,
//                               ),
//                             ),
//                           );
//                         }
//
//                         if (snapshot.hasError) {
//                                print("Hiii2");
//                           print(snapshot.error);
//                           return SizedBox(
//                               height: 100.h,
//                               width: 1.sw,
//                               child: Center(
//                                   child: Text(
//                                 'Error: ${snapshot.error}',
//                                 style: TextStyle(
//                                     fontSize: 14.sp, color: greyColor),
//                               )));
//
//
//                         }
//
//                         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                           print("Hiii1");
//                           print(snapshot.data);
//                           return SizedBox(
//                               height: 100.h,
//                               width: 1.sw,
//                               child: Center(
//                                   child: Text(
//                                 'No events added yet',
//                                 style: TextStyle(
//                                     fontSize: 14.sp, color: greyColor),
//                               )));
//                         }
//
//                         // Retrieve the list of documents
//                         final List<DocumentSnapshot> documents =
//                             snapshot.data!.docs;
//
//                         return ListView.builder(
//                           itemCount: documents.length,
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             final document = documents[index];
//                             final data =
//                                 document.data() as Map<String, dynamic>?;
//                             if (calendarProvider.selectedDate != null) {
//                               if (document["date"].split(' ').first !=
//                                   calendarProvider.selectedDate) {
//                                 return const SizedBox();
//                               }
//                             }
//
//                             if (data == null) {
//                               return const ListTile(
//                                   title: Text('No data available'));
//                             }
//
//                             if (date.day !=
//                                     DateTime.parse(document["date"]).day ||
//                                 date.month !=
//                                     DateTime.parse(document["date"]).month ||
//                                 date.year !=
//                                     DateTime.parse(document["date"]).year) {
//                               return const SizedBox();
//                             }
//
//                             return Padding(
//                               padding: const EdgeInsets.only(top:8.0),
//                               child: Row(
//                                      mainAxisAlignment: (index % 2) == 0
//                                         ? MainAxisAlignment.start
//                                         : MainAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     document["time"],
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 16.sp,
//                                         fontWeight: FontWeight.w600),
//                                   ),
//                                   if(index % 2 != 0)
//                                   Spacer(),
//                                         if(index % 2 == 0)
//                                   SizedBox(width: 30.w),
//
//
//                                   Column(
//                                     crossAxisAlignment: (index % 2) == 0
//                                         ? CrossAxisAlignment.start
//                                         : CrossAxisAlignment.end,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.symmetric(vertical: 5.h),
//                                         child: Container(
//                                           width: 1.sw - 200.w,
//                                           decoration: BoxDecoration(
//                                               color: (index % 2) == 0
//                                                   ? primaryColor
//                                                   : Color(0xff1642DB),
//                                               borderRadius:
//                                                   BorderRadius.circular(16.r),
//                                               border:
//                                                   Border.all(color: borderColor1)),
//                                           child: ListTile(
//                                             title: Row(children: [
//                                               // CustomText(
//                                               //   text: 'Event: ',
//                                               //   fontSize: 19.sp,
//                                               //   fontWeight: FontWeight.w600,
//                                               //   color: whiteColor,
//                                               // ),
//                                               SizedBox(
//                                                 width: 1.sh / 6.5,
//                                                 child: CustomText(
//                                                   text: document["eventName"]+ " "+   happyEmojis[random.nextInt(happyEmojis.length)],
//                                                   fontSize: 18.sp,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: whiteColor,
//                                                 ),
//                                               )
//                                             ]),
//                                             // subtitle: Column(
//                                             //   crossAxisAlignment:
//                                             //       CrossAxisAlignment.start,
//                                             //   children: [
//                                             //     Row(children: [
//                                             //       CustomText(
//                                             //         text: 'Event Time: ',
//                                             //         fontSize: 19.sp,
//                                             //         fontWeight: FontWeight.w600,
//                                             //         color: whiteColor,
//                                             //       ),
//                                             //       CustomText(
//                                             //         text: document["time"],
//                                             //         fontSize: 18.sp,
//                                             //         fontWeight: FontWeight.w500,
//                                             //         color: whiteColor,
//                                             //       )
//                                             //     ]),
//                                             //     Row(children: [
//                                             //       CustomText(
//                                             //         text: 'Reminder Time: ',
//                                             //         fontSize: 19.sp,
//                                             //         fontWeight: FontWeight.w600,
//                                             //         color: whiteColor,
//                                             //       ),
//                                             //       CustomText(
//                                             //         text: document["reminderTime"],
//                                             //         fontSize: 18.sp,
//                                             //         fontWeight: FontWeight.w500,
//                                             //         color: whiteColor,
//                                             //       )
//                                             //     ]),
//                                             //   ],
//                                             // ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   );
//                 },
//                 // eventTileBuilder: (date, events, boundary, start, end) {
//                 //   if (events.isEmpty) return Container(); // No events case
//
//                 //   return ListView.builder(
//                 //     itemCount: events.length,
//                 //     itemBuilder: (context, index) {
//                 //       final event = events[index];
//
//                 //       return ListTile(
//                 //         contentPadding: EdgeInsets.all(8.0),
//                 //         title: Text(
//                 //           event.title ?? 'Untitled Event',
//                 //           style: TextStyle(
//                 //             fontWeight: FontWeight.bold,
//                 //             color: Colors.black,
//                 //           ),
//                 //         ),
//                 //         subtitle: Text(
//                 //           'dsd', // Event time placeholder
//                 //           style: TextStyle(
//                 //             color: Colors.grey,
//                 //           ),
//                 //         ),
//                 //         leading: Icon(Icons.event, color: Colors.blue),
//                 //         tileColor: Colors.white,
//                 //         shape: RoundedRectangleBorder(
//                 //           borderRadius: BorderRadius.circular(10),
//                 //           side: BorderSide(color: Colors.grey.withOpacity(0.3)),
//                 //         ),
//                 //         onTap: () {
//                 //           print('Event tapped: ${event.title}');
//                 //         },
//                 //       );
//                 //     },
//                 //   );
//                 // },
//                 showVerticalLine: false, // Hide vertical lines
//                 showLiveTimeLineInAllDays: false, // Hide live timeline
//                 minDay: DateTime.now(),
//                 maxDay: DateTime(3000),
//                 initialDay: DateTime.now(),
//                 eventArranger: SideEventArranger(),
//                 startHour: 1,
//
//                 hourLinePainter: (lineColor,
//                     lineHeight,
//                     offset,
//                     minuteHeight,
//                     showVerticalLine,
//                     verticalLineOffset,
//                     lineStyle,
//                     dashWidth,
//                     dashSpaceWidth,
//                     emulateVerticalOffsetBy,
//                     startHour,
//                     endHour) {
//                   lineColor = Colors.transparent;
//                   return InvisibleLinePainter();
//                 },
//
//                 endHour: 10,
//               ),
//             );
//
//       // : SizedBox(
//       //     height: 1.sh,
//       //     width: 1.sw,
//       //     child: DayView(
//       //       backgroundColor: Colors.transparent,
//       //       controller: EventController(),
//       //       eventTileBuilder: (date, events, boundry, start, end) {
//       //         // Return your widget to display as event tile.
//       //         return Container();
//       //       },
//       //       fullDayEventBuilder: (events, date) {
//       //         // Return your widget to display full day event view.
//       //         return Container();
//       //       },
//       //       showVerticalLine:
//       //           false, // To display live time line in day view.
//       //       showLiveTimeLineInAllDays:
//       //           true, // To display live time line in all pages in day view.
//       //       minDay: DateTime.now(),
//       //       maxDay: DateTime(3000),
//       //       initialDay: DateTime.now(),
//       //       heightPerMinute: 1,
//
//       //       headerStyle: HeaderStyle(
//       //           headerTextStyle: const TextStyle(
//       //               color: primaryColor, fontWeight: FontWeight.bold),
//       //           decoration: BoxDecoration(
//       //               color: Colors.transparent,
//       //               border: Border.all(
//       //                 color: lightGreyColor,
//       //               ),
//       //               borderRadius: BorderRadius.circular(
//       //                   10.sp))), // height occupied by 1 minute time span.
//       //       eventArranger:
//       //           const SideEventArranger(), // To define how simultaneous events will be arranged.
//       //       onEventTap: (events, date) => print(events),
//       //       onEventDoubleTap: (events, date) => print(events),
//       //       onEventLongTap: (events, date) => print(events),
//       //       onDateLongPress: (date) => print(date),
//       //       startHour: 5, // To set the first hour displayed (ex: 05:00)
//       //       // To set the end hour displayed
//
//       //       // To Hide day header
//       //       keepScrollOffset:
//       //           true, // To maintain scroll offset when the page changes
//       //     ));
//
//       ///
//       ///  ------>  Disable
//       ///
//       ///
//     });
//   }
//
//   List<Appointment> _getDataSource() {
//     return [
//       Appointment(
//         startTime: DateTime.now().add(const Duration(hours: 1)),
//         endTime: DateTime.now().add(const Duration(hours: 2)),
//         subject: 'Meeting',
//         notes: 'Room 1',
//         color: Colors.blue,
//       ),
//       Appointment(
//         startTime: DateTime.now().add(const Duration(hours: 1)),
//         endTime: DateTime.now().add(const Duration(hours: 2)),
//         subject: '',
//         notes: 'Room 1',
//         color: Colors.blue,
//       ),
//       Appointment(
//         startTime: DateTime.now().add(const Duration(hours: 3)),
//         endTime: DateTime.now().add(const Duration(hours: 4)),
//         subject: 'Release Meeting',
//         notes: 'Room 1',
//         color: Colors.green,
//       ),
//       Appointment(
//         startTime: DateTime.now().add(const Duration(hours: 7)),
//         endTime: DateTime.now().add(const Duration(hours: 8)),
//         subject: 'Performance Check',
//         notes: 'Room 1',
//         color: Colors.pink,
//       ),
//       Appointment(
//         startTime: DateTime.now().add(const Duration(hours: 10)),
//         endTime: DateTime.now().add(const Duration(hours: 11)),
//         subject: 'Support',
//         notes: 'Room 1',
//         color: Colors.purple,
//       ),
//       Appointment(
//         startTime: DateTime.now().add(const Duration(hours: 9)),
//         endTime: DateTime.now().add(const Duration(hours: 10)),
//         subject: 'Retrospective',
//         notes: 'Room 1',
//         color: Colors.orange,
//       ),
//     ];
//   }
// }
//
// class EventDataSource extends CalendarDataSource {
//   EventDataSource(List<Appointment> source) {
//     appointments = source;
//   }
// }
//
// class InvisibleLinePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Do not draw anything
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false; // No need to repaint
//   }
// }
