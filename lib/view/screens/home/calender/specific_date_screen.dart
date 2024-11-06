// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:task_talk/config/constant/color.dart';
// import 'package:task_talk/view/custom/custom_text/custom_text.dart';

// class SpecificDateEvents extends StatefulWidget {
//   const SpecificDateEvents({super.key});

//   @override
//   State<SpecificDateEvents> createState() => _SpecificDateEventsState();
// }

// class _SpecificDateEventsState extends State<SpecificDateEvents> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Icon(Icons.arrow_back)),
//                     CustomText(
//                       text: 'Events on 6/28/2024',
//                       fontSize: 23.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         // Navigator.pop(context);
//                       },
//                       child: const Icon(
//                         Icons.arrow_forward,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: List.generate(3, (index) {
//                     return Padding(
//                       padding: EdgeInsets.symmetric(vertical: 8.h),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16.r),
//                             border: Border.all(color: borderColor1)),
//                         child: ListTile(
//                           title: Row(children: [
//                             CustomText(
//                               text: 'Event: ',
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w600,
//                               color: textColor2,
//                             ),
//                             CustomText(
//                               text: 'Study',
//                               fontSize: 19.sp,
//                               fontWeight: FontWeight.w500,
//                               color: textColor2,
//                             )
//                           ]),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(children: [
//                                 CustomText(
//                                   text: 'Date: ',
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor2,
//                                 ),
//                                 CustomText(
//                                   text: '12345',
//                                   fontSize: 19.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: textColor2,
//                                 )
//                               ]),
//                               Row(children: [
//                                 CustomText(
//                                   text: 'Time: ',
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor2,
//                                 ),
//                                 CustomText(
//                                   text: '6789',
//                                   fontSize: 19.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: textColor2,
//                                 )
//                               ]),
//                               Row(children: [
//                                 CustomText(
//                                   text: 'Reminder Time: ',
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor2,
//                                 ),
//                                 CustomText(
//                                   text: '12345',
//                                   fontSize: 19.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: textColor2,
//                                 )
//                               ]),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }),
//                 ),
//                 GestureDetector(
//                   child: Container(
//                     width: 350.w,
//                     height: 55.h,
//                     decoration: BoxDecoration(
//                       color: primaryColor,
//                       borderRadius: BorderRadius.circular(16.r),
//                     ),
//                     child: Center(
//                       child: CustomText(
//                         text: 'Done',
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w600,
//                         color: whiteColor,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:task_talk/config/constant/color.dart';
// import 'package:task_talk/view/custom/custom_text/custom_text.dart';
//
// import '../../../common_widgets/custom_text.dart';
//
// class SpecificDateEvents extends StatefulWidget {
//   const SpecificDateEvents({super.key});
//
//   @override
//   State<SpecificDateEvents> createState() => _SpecificDateEventsState();
// }
//
// class _SpecificDateEventsState extends State<SpecificDateEvents> {
//   // Sample data for events
//   final List<Map<String, String>> events = [
//     {
//       'name': 'Study',
//       'date': '6/28/2024',
//       'time': '10:00 AM',
//       'reminderTime': '9:00 AM'
//     },
//     {
//       'name': 'Meeting',
//       'date': '6/28/2024',
//       'time': '12:00 PM',
//       'reminderTime': '11:30 AM'
//     },
//     {
//       'name': 'Workout',
//       'date': '6/28/2024',
//       'time': '6:00 PM',
//       'reminderTime': '5:30 PM'
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: Icon(Icons.arrow_back)),
//                   CustomText(
//                     text: 'Events on 6/28/2024',
//                     fontSize: 23.sp,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.arrow_forward,
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: events.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: EdgeInsets.symmetric(vertical: 8.h),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16.r),
//                             border: Border.all(color: borderColor1)),
//                         child: ListTile(
//                           title: Row(children: [
//                             CustomText(
//                               text: 'Event: ',
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w600,
//                               color: textColor2,
//                             ),
//                             CustomText(
//                               text: events[index]['name']!,
//                               fontSize: 19.sp,
//                               fontWeight: FontWeight.w500,
//                               color: textColor2,
//                             )
//                           ]),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(children: [
//                                 CustomText(
//                                   text: 'Date: ',
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor2,
//                                 ),
//                                 CustomText(
//                                   text: events[index]['date']!,
//                                   fontSize: 19.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: textColor2,
//                                 )
//                               ]),
//                               Row(children: [
//                                 CustomText(
//                                   text: 'Time: ',
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor2,
//                                 ),
//                                 CustomText(
//                                   text: events[index]['time']!,
//                                   fontSize: 19.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: textColor2,
//                                 )
//                               ]),
//                               Row(children: [
//                                 CustomText(
//                                   text: 'Reminder Time: ',
//                                   fontSize: 20.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor2,
//                                 ),
//                                 CustomText(
//                                   text: events[index]['reminderTime']!,
//                                   fontSize: 19.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: textColor2,
//                                 )
//                               ]),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               GestureDetector(
//                 child: Container(
//                   width: 350.w,
//                   height: 55.h,
//                   decoration: BoxDecoration(
//                     color: primaryColor,
//                     borderRadius: BorderRadius.circular(16.r),
//                   ),
//                   child: Center(
//                     child: CustomText(
//                       text: 'Done',
//                       fontSize: 20.sp,
//                       fontWeight: FontWeight.w600,
//                       color: whiteColor,
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
