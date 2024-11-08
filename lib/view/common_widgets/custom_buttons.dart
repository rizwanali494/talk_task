


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';

import '../../utilis/app_colors.dart';

class Buttons{
  static Widget customElevatedButton({required String title,required Color backgroundColor,required Color textColor,required VoidCallback ? onPressed}){
    return SizedBox(
      height: 50.h,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.r)
            )
          ),
          onPressed: onPressed, child: Text(title,style: AppTextStyles.poppins(color: textColor, fontSize: 20.sp, weight: FontWeight.w500),)),
    );
  }


  static Widget customIconButton({required GestureTapCallback ? onPressed,required String icon}){
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(21.r),
      child: Container(
        height: 45.h,
        width:45.h ,
        clipBehavior: Clip.antiAlias,
        decoration:  const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle
        ),
        child: Image.asset(icon,height: 45.h,),
      ),
    );
  }

  static Widget customCalenderDateButton({required String title,required Color backgroundColor,required Color textColor,required Function ? onPressed}){
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        border: Border.all(color:textColor),
         borderRadius: BorderRadius.circular(13.r)
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13.r)
              )
          ),
          onPressed: (){}, child: Text(title,style: AppTextStyles.poppins(color: textColor, fontSize: 16.sp, weight: FontWeight.w400),)),
    );
  }

  static Widget textButton({required String title,required VoidCallback ? onPressed,}){
    return TextButton(onPressed: onPressed, child: Text(title,style: AppTextStyles.poppins(color: AppColors.primary, fontSize: 15.sp, weight: FontWeight.w500,shouldUnderline: true),));
  }
}