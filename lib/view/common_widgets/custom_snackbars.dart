import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import '../../utilis/app_colors.dart';

class SnackBars{

  static showSnackBar({required String message})
{
  return SnackBar(
    backgroundColor: AppColors.primary,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 20.w),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r)
    ),
    content: CustomText(text: message,fontSize: 12.sp,color: AppColors.whiteFFFFF,),);
}


}