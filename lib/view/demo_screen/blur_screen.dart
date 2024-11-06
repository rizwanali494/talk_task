// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
//
// class BlurScreen extends StatefulWidget {
//   const BlurScreen({super.key, required this.isShowIcon});
//   final bool isShowIcon;
//
//   @override
//   State<BlurScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<BlurScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//
//           ///
//           /// ------>  Appbar Section
//           ///
//           appBar: PreferredSize(
//             preferredSize: Size(double.infinity, 70.h),
//             child: Consumer<HomeModel>(builder: (context, model, child) {
//               return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Image.asset(Asset.notificationIcon,
//                         width: 42.w, height: 42.h),
//                     GestureDetector(
//                         onTap: () {},
//                         child: Image.asset(Asset.settingIcon,
//                             width: 42.w, height: 42.h)),
//                   ],
//                 ),
//               );
//             }),
//           ),
//
//           ///
//           /// ------>  Body Section
//           ///
//
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 17.w),
//               child: Consumer<HomeModel>(builder: (context, model, child) {
//                 return BlurScreenContent(isShowIcon: widget.isShowIcon);
//               }),
//             ),
//           ),
//           bottomNavigationBar:
//               Consumer<HomeModel>(builder: (context, model, child) {
//             return Container(
//               height: 57.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(25.r),
//                   topLeft: Radius.circular(25.r),
//                 ),
//                 border: Border.all(color: primaryColor),
//               ),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(25.r),
//                     topRight: Radius.circular(25.r),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       ...List.generate(
//                         3,
//                         (index) => SizedBox(
//                           width: 100.w,
//                           height: 50.h,
//                           child: Center(
//                             child: Image.asset(
//                               model.icons[index],
//                               height: 30.h,
//                               width: 30.h,
//                               color: model.currentIndex == index
//                                   ? primaryColor
//                                   : textColor1,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   )),
//             );
//           })),
//     );
//   }
// }
//
// class BlurScreenContent extends StatelessWidget {
//   const BlurScreenContent({super.key, required this.isShowIcon});
//   final bool isShowIcon;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//     // double width = size.width;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: double.infinity,
//           height: height * 0.62,
//           margin: EdgeInsets.only(top: 10.h),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.r),
//               border: Border.all(color: borderColor1)),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
//             child: Column(
//               children: [
//                 /// ------> Add Task Section
//
//                 isShowIcon == true
//                     ? CustomText(
//                         text: 'Add Task',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.sp,
//                       )
//                     : const SizedBox.shrink(),
//                 // SizedBox(height: 5.h),
//                 isShowIcon == true
//                     ? Image.asset(Asset.addTaskIcon,
//                         width: 157.w, height: height * 0.15)
//                     : SizedBox(width: 157.w, height: 157.h),
//                 // SizedBox(height: 16.h),
//
//                 /// ------> Event, Date, Time Section
//                 ///  Type 0 - Event;  1 - Date; 2 - Time; 3 - Reminder Time
//
//                 CustomTextField(
//                   labelText: 'Date:',
//                   type: 1,
//                   readOnly: true,
//                   controller: TextEditingController(),
//                   reminderType: "",
//                 ),
//                 CustomTextField(
//                   labelText: 'Time:',
//                   type: 2,
//                   readOnly: true,
//                   reminderType: "",
//                   controller: TextEditingController(),
//                 ),
//                 CustomTextField(
//                   labelText: 'Reminder Time:',
//                   type: 3,
//                   reminderType: "",
//                   readOnly: true,
//                   controller: TextEditingController(),
//                 ),
//                 CustomTextField(
//                   labelText: 'Event:',
//                   type: 0,
//                   reminderType: "",
//                   readOnly: false,
//                   controller: TextEditingController(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 8),
//         Padding(
//           padding: EdgeInsets.only(left: 15.w),
//           child: const CustomText(
//             text: 'Upcoming Events',
//             fontSize: 20,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         SizedBox(height: 5.h),
//         Column(
//           children: List.generate(1, (index) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 9.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.r),
//                     border: Border.all(color: borderColor1)),
//                 child: ListTile(
//                   title: Row(children: [
//                     CustomText(
//                       text: 'Event: ',
//                       fontSize: 19.sp,
//                       fontWeight: FontWeight.w600,
//                       color: textColor2,
//                     ),
//                     CustomText(
//                       text: 'Study',
//                       fontSize: 18.sp,
//                       fontWeight: FontWeight.w500,
//                       color: textColor2,
//                     )
//                   ]),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(children: [
//                         CustomText(
//                           text: 'Date: ',
//                           fontSize: 19.sp,
//                           fontWeight: FontWeight.w600,
//                           color: textColor2,
//                         ),
//                         CustomText(
//                           text: '12345',
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w500,
//                           color: textColor2,
//                         )
//                       ]),
//                       Row(children: [
//                         CustomText(
//                           text: 'Time: ',
//                           fontSize: 19.sp,
//                           fontWeight: FontWeight.w600,
//                           color: textColor2,
//                         ),
//                         CustomText(
//                           text: '6789',
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w500,
//                           color: textColor2,
//                         )
//                       ]),
//                       Row(children: [
//                         CustomText(
//                           text: 'Reminder Time: ',
//                           fontSize: 19.sp,
//                           fontWeight: FontWeight.w600,
//                           color: textColor2,
//                         ),
//                         CustomText(
//                           text: '12345',
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w500,
//                           color: textColor2,
//                         )
//                       ]),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
// }
