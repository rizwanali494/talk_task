//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:talk_task/utilis/app_constants.dart';
// import '../../utilis/app_colors.dart';
// import '../../utilis/app_images.dart';
// import 'custom_buttons.dart';
//
// class Drawers {
//   static Widget homeScreensDrawer(){
//     return Align(
//       alignment: Alignment.topRight,
//       child: Stack(
//         children: [
//           Container(
//             height: 340.h,
//             child: Drawer(
//               width: 300.w,
//
//               shadowColor: AppColors.transparent,
//               elevation: 0,
//               surfaceTintColor: AppColors.transparent,
//               backgroundColor: AppColors.whiteFFFFF,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(9.r),
//               ),
//               child: Column(children: [
//               Buttons.drawerButtons(title: AppConstants.settings, onPressed: (){}, iconPath: AppImages.iconSettings)
//             ],),),
//           ),
//         ],
//       ),
//     );
//   }
// }