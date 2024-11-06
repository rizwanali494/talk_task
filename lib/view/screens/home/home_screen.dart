// // ignore_for_file: use_build_context_synchronously
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   bool loading=true;
//   @override
//   void initState() {
//    // checkAndNavigationCallingPage();
//
//     super.initState();
//   }
//  //
//  //  Future<void> checkAndNavigationCallingPage() async {
//  //    var currentCall = await getCurrentCall();
//  //    if (currentCall != null) {
//  //
//  //
//  // NavigationService.instance.pushNamedIfNotCurrent(RoutesName.eventCall,args: EventScreen(callString: currentCall['handle']));
//  //    }
//  //    setState(() {
//  //      loading=false;
//  //    });
//  //  }
//  //
//  //  Future<dynamic> getCurrentCall() async {
//  //    String? _currentUuid;
//  //    //check current call from pushkit if possible
//  //    var calls = await FlutterCallkitIncoming.activeCalls();
//  //    if (calls is List) {
//  //      if (calls.isNotEmpty) {
//  //        print('DATA: $calls');
//  //        _currentUuid = calls[0]['id'];
//  //        return calls[0];
//  //      } else {
//  //        _currentUuid = "";
//  //        return null;
//  //      }
//  //    }
//  //  }
//
//   @override
//   Widget build(BuildContext context) {
//    // final HomeViewModelGetX notificationsController = Get.find();
//     return GestureDetector(
//          onTap: () {
//         FocusScope.of(context).unfocus(); // Dismiss the keyboard
//       },
//       child: SafeArea(
//         child: Scaffold(
//             appBar: PreferredSize(
//               preferredSize: Size(double.infinity, 70.h),
//               child: Consumer<HomeModel>(builder: (context, model, child) {
//                 return model.currentIndex != 2
//                     ? Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 17.w, vertical: 13.h),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 notificationsController
//                                     .updateNotificationStatusTrue();
//                                 Navigator.pushNamedAndRemoveUntil(context,
//                                     RoutesName.notification, (route) => true);
//                               },
//                               child: Obx(() => !notificationsController
//                                       .notificationOpened.value
//                                   ? Badge(
//                                       largeSize: 20.h,
//                                       smallSize: 15.h,
//                                       child: Image.asset(Asset.notificationIcon,
//                                           width: 42.w, height: 42.h),
//                                     )
//                                   : Image.asset(Asset.notificationIcon,
//                                       width: 42.w, height: 42.h)),
//                             ),
//                             CustomText(
//                               text: model.currentIndex == 0
//                                   ? "Reoccurring Reminders"
//                                   : 'Reminders',
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             GestureDetector(
//                                 onTap: () {
//                                   Navigator.pushNamedAndRemoveUntil(context,
//                                       RoutesName.setting, (route) => true);
//                                 },
//                                 child: Image.asset(Asset.settingIcon,
//                                     width: 42.w, height: 42.h)),
//                           ],
//                         ),
//                       )
//                     : Padding(
//                         padding: EdgeInsets.only(
//                             left: 17.w, right: 8.w, top: 13.h, bottom: 13.h),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 model.setIndex(1);
//                               },
//                               child: Image.asset(Asset.backIcon,
//                                   width: 42.w, height: 42.h),
//                             ),
//                             CustomText(
//                               text: 'Tasks',
//                               fontSize: 20.sp,
//                               fontWeight: FontWeight.w700,
//                             ),
//                             SizedBox(),
//                             Transform.scale(
//                               scale: 0.9.sp,
//                               child: Switch(
//                                 value: model.isTask,
//                                 onChanged: (value) {
//                                   model.setTask(value);
//                                 },
//                                 activeTrackColor: primaryColor,
//                                 activeColor: whiteColor,
//                                 inactiveThumbColor: whiteColor,
//                                 inactiveTrackColor: greyColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//               }),
//             ),
//             body:loading?  const SpinKitCircle(
//                         color: primaryColor,
//                         size: 50.0,
//                       ): SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 17.w),
//                 child: Consumer<HomeModel>(builder: (context, model, child) {
//                   return Column(
//                     children: [
//                       if (model.currentIndex == 0)
//                         const ReoccuringReminderScreen(),
//                       if (model.currentIndex == 1) const SetReminderScreen(),
//                       if (model.currentIndex == 2) const CalenderScreen(),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//             bottomNavigationBar:
//                 Consumer<HomeModel>(builder: (context, model, child) {
//               return Container(
//                 height: 57.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(25.r),
//                     topLeft: Radius.circular(25.r),
//                   ),
//                   border: Border.all(color: primaryColor),
//                 ),
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(25.r),
//                       topRight: Radius.circular(25.r),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         ...List.generate(
//                           3,
//                           (index) => GestureDetector(
//                             onTap: () {
//                               model.setIndex(index);
//                             },
//                             child: SizedBox(
//                               width: 100.w,
//                               height: 50.h,
//                               child: Center(
//                                 child: Image.asset(
//                                   model.icons[index],
//                                   height: 30.h,
//                                   width: 30.h,
//                                   color: model.currentIndex == index
//                                       ? primaryColor
//                                       : textColor1,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//               );
//             })),
//       ),
//     );
//   }
// }
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     //  final HomeViewModelGetX notificationsController = Get.find();
//     return SafeArea(
//       child: Scaffold(
//
//           ///
//           /// ------>  Appbar Section
//           ///
//           appBar: PreferredSize(
//             preferredSize: Size(double.infinity, 70.h),
//             child: Consumer<HomeModel>(builder: (context, model, child) {
//               return model.currentIndex != 2
//                   ? Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 17.w, vertical: 13.h),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pushNamedAndRemoveUntil(context,
//                                   RoutesName.notification, (route) => true);
//                                   // model.updateNotificationStatus();
//                             },
//                             child:!notificationsController.notificationOpened.v
//                                 ? Image.asset(Asset.notificationIcon,
//                                     width: 42.w, height: 42.h)
//                                 : Badge(
//                                     largeSize: 20.h,
//                                     smallSize: 15.h,
//                                     child: Image.asset(Asset.notificationIcon,
//                                         width: 42.w, height: 42.h),
//                                   ),
//                           ),
//                           CustomText(
//                             text: model.currentIndex == 0
//                                 ? "Reoccurring Reminders"
//                                 : 'Reminders',
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           GestureDetector(
//                               onTap: () {
//                                 Navigator.pushNamedAndRemoveUntil(context,
//                                     RoutesName.setting, (route) => true);
//                               },
//                               child: Image.asset(Asset.settingIcon,
//                                   width: 42.w, height: 42.h)),
//                         ],
//                       ),
//                     )
//                   : Padding(
//                       padding: EdgeInsets.only(
//                           left: 17.w, right: 8.w, top: 13.h, bottom: 13.h),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               model.setIndex(1);
//                             },
//                             child: Image.asset(Asset.backIcon,
//                                 width: 42.w, height: 42.h),
//                           ),
//                           CustomText(
//                             text: 'Tasks',
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           Transform.scale(
//                             scale: 0.9.sp,
//                             child: Switch(
//                               value: model.isTask,
//                               onChanged: (value) {
//                                 model.setTask(value);
//                               },
//                               activeTrackColor: primaryColor,
//                               activeColor: whiteColor,
//                               inactiveThumbColor: whiteColor,
//                               inactiveTrackColor: greyColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//             }),
//           ),
//
//           ///
//           /// ------>  Body Section
//           ///

          // body: SingleChildScrollView(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 17.w),
          //     child: Consumer<HomeModel>(builder: (context, model, child) {
          //       return Column(
          //         children: [
          //           if (model.currentIndex == 0)
          //             const ReoccuringReminderScreen(),
          //           if (model.currentIndex == 1) const SetReminderScreen(),
          //           if (model.currentIndex == 2) const CalenderScreen(),
          //         ],
          //       );
          //     }),
          //   ),
          // ),
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
//
//                     topRight: Radius.circular(25.r),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       ...List.generate(
//                         3,
//                         (index) => GestureDetector(
//                           onTap: () {
//                             model.setIndex(index);
//                           },
//                           child: SizedBox(
//                             width: 100.w,
//                             height: 50.h,
//                             child: Center(
//                               child: Image.asset(
//                                 model.icons[index],
//                                 height: 30.h,
//                                 width: 30.h,
//                                 color: model.currentIndex == index
//                                     ? primaryColor
//                                     : textColor1,
//                               ),
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





class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Home'),);
  }
}
