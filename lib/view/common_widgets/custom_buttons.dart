


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';

class Buttons{
  static Widget customElevatedButton({required String title,required Color backgroundColor,required Color textColor,required Function ? onPressed}){
    return Container(
      height: 50.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.r)
            )
          ),
          onPressed: (){}, child: Text(title,style: AppTextStyles.poppins(color: textColor, fontSize: 20.sp, weight: FontWeight.w500),)),
    );
  }
}