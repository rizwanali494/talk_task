


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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


  static settingsAppBar({required BuildContext context,required String title}){
    return PreferredSize(
        preferredSize: Size(double.infinity, 70.h),
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
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
                text: title,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(width: 30.w)
            ],
          ),
        ));
  }

}