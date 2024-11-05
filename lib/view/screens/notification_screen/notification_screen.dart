// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
//
// import '../../common_widgets/custom_text.dart';
//
//
// class NotificationScreen extends StatefulWidget {
//   const NotificationScreen({super.key});
//
//   @override
//   State<NotificationScreen> createState() => _NotificationScreenState();
// }
//
// class _NotificationScreenState extends State<NotificationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         ///
//         /// ------>  Appbar Section
//         ///
//         appBar: PreferredSize(
//           preferredSize: Size(double.infinity, 70.h),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Image.asset(Asset.backIcon, width: 42.w, height: 42.h),
//                 ),
//                 CustomText(
//                     text: 'Notification',
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.bold,
//                     color: textColor3),
//                 Image.asset(
//                   Asset.settingIcon,
//                   width: 42.w,
//                   height: 42.h,
//                   color: Colors.transparent,
//                 )
//               ],
//             ),
//           ),
//         ),
//
//         ///
//         /// ------>  Body Section
//         ///
//         body: SizedBox(
//           height: 1.sh,
//           width: 1.sw,
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 23.h),
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('Notifications')
//                   .where("FCM", isEqualTo: token)
//                   .snapshots(),
//               builder: (BuildContext context,
//                   AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }
//
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: SpinKitCircle(
//                       color: Color(0xFF1642DB),
//                       size: 50.0,
//                     ),
//                   );
//                 }
//
//                 // The stream data is ready, build the ListView
//                 final documents = snapshot.data?.docs ?? [];
//
//                 return ListView.builder(
//                   itemCount: documents.length,
//                   itemBuilder: (context, index) {
//                     var data = documents[index].data() as Map<String, dynamic>;
//
//                     return Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 20.h, bottom: 34.h),
//                           child: Row(
//                             children: [
//                               if (data["Type"] == "eventuploaded")
//                                 Image.asset(
//                                   Asset.checkIcon,
//                                   height: 48.h,
//                                   width: 48.w,
//                                 ),
//                               if (data["Type"] == "reminderalert")
//                                 const Icon(
//                                   Icons.notifications_active,
//                                   color: primaryColor,
//                                 ),
//                               SizedBox(width: 16.w),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomText(
//                                     text: data["Title"],
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   SizedBox(height: 4.h),
//                                   CustomText(
//                                     text: DateFormat('yyyy-MM-dd h:mma').format(DateTime.parse(data["DateTime"])).toLowerCase() ,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w400,
//                                     color: textColor1,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         const Divider(
//                           color: Color(0xffCECECE),
//                         )
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
