


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilis/app_colors.dart';
import '../../utilis/app_constants.dart';
import '../../utilis/app_images.dart';
import 'custom_text.dart';

class AppBars{
  static AppBar authAppBars({required Color bgColor,required Brightness iconBrightness}){
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: iconBrightness
      ),
    );
  }


  static AppBar settingsAppBar({required BuildContext context,required String title}){
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteFFFFF,
      shadowColor: AppColors.whiteFFFFF,
      surfaceTintColor:AppColors.whiteFFFFF ,
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark,statusBarColor: AppColors.whiteFFFFF),
      title: Container(
        color: AppColors.whiteFFFFF,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AppImages.iconBack,
                  width: 42.w, height: 42.h),
            ),
            CustomText(
              color: AppColors.blueDark002055,
              text: title,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(width: 30.w)
          ],
        ),
      ),
    );
  }

}