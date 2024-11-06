// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:task_talk/config/constant/asset.dart';
// import 'package:task_talk/config/constant/color.dart';
// import 'package:task_talk/view/custom/custom_text/custom_text.dart';
// import 'package:task_talk/view/home/home_model.dart';

// class DemoBackgroundScreen extends StatelessWidget {
//   final int type;
//   const DemoBackgroundScreen({super.key, required this.type});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       ///
//       /// ------>  Appbar Section
//       ///
//       appBar: PreferredSize(
//         preferredSize: Size(double.infinity, 70.h),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(Asset.notificationIcon, width: 42.w, height: 42.h),
//               CustomText(
//                 text: 'Reminders',
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//               Image.asset(Asset.settingIcon, width: 42.w, height: 42.h)
//             ],
//           ),
//         ),
//       ),

//       ///
//       /// ------>  Body Section
//       ///

//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 17.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.r),
//                     border: Border.all(color: borderColor1)),
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
//                   child: Column(
//                     children: [
//                       CustomText(
//                         text: 'Add Task',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.sp,
//                       ),
//                       // SizedBox(height: 5.h),
//                       Image.asset(Asset.addTaskIcon,
//                           width: 157.w, height: 157.h)

//                       // SizedBox(height: 16.h),

//                       ,
//                       const Column(
//                         children: [
//                           CustomTextField(
//                             labelText: 'Event:',
//                           ),
//                           CustomTextField(
//                             labelText: 'Date:',
//                           ),
//                           CustomTextField(
//                             labelText: 'Time:',
//                           ),
//                           CustomTextField(
//                             labelText: 'Reminder Time:',
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       ElevatedButton(
//                           onPressed: () {},
//                           style: ButtonStyle(
//                             backgroundColor:
//                                 MaterialStateProperty.all<Color>(buttonColor),
//                             minimumSize: MaterialStateProperty.all<Size>(
//                                 Size(327.w, 50.h)),
//                             shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(16.r))),
//                           ),
//                           child: CustomText(
//                             text: 'Add Event',
//                             fontSize: 24.sp,
//                             fontWeight: FontWeight.w500,
//                             color: whiteColor,
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               Padding(
//                   padding: EdgeInsets.only(left: 15.w),
//                   child: CustomText(
//                     text: 'Upcoming Events',
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.w700,
//                   )),
//               SizedBox(height: 5.h),
//               Column(
//                 children: List.generate(5, (index) {
//                   return Padding(
//                       padding: const EdgeInsets.only(bottom: 9.0),
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16.r),
//                             border: Border.all(color: borderColor1)),
//                         child: ListTile(
//                           title: Row(children: [
//                             CustomText(
//                               text: 'Event: ',
//                               fontSize: 19.sp,
//                               fontWeight: FontWeight.w600,
//                               color: textColor2,
//                             ),
//                             CustomText(
//                               text: 'Study',
//                               fontSize: 18.sp,
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
//                                   fontSize: 19.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor2,
//                                 ),
//                                 CustomText(
//                                   text: '12345',
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: textColor2,
//                                 )
//                               ]),
//                               Row(children: [
//                                 CustomText(
//                                   text: 'Time: ',
//                                   fontSize: 19.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor2,
//                                 ),
//                                 CustomText(
//                                   text: '6789',
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: textColor2,
//                                 )
//                               ]),
//                               Row(children: [
//                                 CustomText(
//                                   text: 'Reminder Time: ',
//                                   fontSize: 19.sp,
//                                   fontWeight: FontWeight.w600,
//                                   color: textColor2,
//                                 ),
//                                 CustomText(
//                                   text: '12345',
//                                   fontSize: 18.sp,
//                                   fontWeight: FontWeight.w500,
//                                   color: textColor2,
//                                 )
//                               ]),
//                             ],
//                           ),
//                         ),
//                       ));
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Consumer<HomeModel>(
//         builder: (context, model, child) {
//           return Container(
//             height: 57.h,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(25.r),
//                 topLeft: Radius.circular(25.r),
//               ),
//               border: Border.all(color: primaryColor),
//             ),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25.r),
//                   topRight: Radius.circular(25.r),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ...List.generate(
//                       3,
//                       (index) => SizedBox(
//                         width: 100.w,
//                         height: 50.h,
//                         child: Center(
//                           child: Image.asset(
//                             model.icons[index],
//                             height: 30.h,
//                             width: 30.h,
//                             color: textColor1,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 )),
//           );
//         },
//       ),
//     ));
//   }
// }

// class CustomTextField extends StatelessWidget {
//   final String labelText;

//   const CustomTextField({
//     super.key,
//     required this.labelText,
//   });

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
//               TextField(
//                 style: GoogleFonts.poppins(fontSize: 16.sp, color: textColor1),
//                 cursorColor: textColor1,
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
//             ],
//           ),
//         ),
//         SizedBox(height: 5.h),
//       ],
//     );
//   }
// }
