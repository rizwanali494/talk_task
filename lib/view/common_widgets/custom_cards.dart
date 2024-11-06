


import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import '../../utilis/app_colors.dart';

class CustomCards{

  static TextStyle eventStyle=AppTextStyles.poppins(color: AppColors.grey787878.withOpacity(0.7), fontSize: 19.sp, weight: FontWeight.w400);

  static Widget eventCard({required String event,required String date,required String time,required String remainderTime}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.w),
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      decoration: BoxDecoration(
          color: AppColors.whiteFFFFF,
        boxShadow: const [BoxShadow(color: AppColors.blueBorder,spreadRadius: 1.0,blurRadius: 1.2)],
        borderRadius: BorderRadius.circular(14.r)
      ),
      child:Column(children: [
        SizedBox(height: 5.h,),
        Row(children: [
          Text(AppConstants.event,style: AppTextStyles.poppins(color: AppColors.grey787878.withOpacity(0.6), fontSize: 20.sp, weight: FontWeight.w600),),
          Text(event,style: eventStyle,),
        ],),
        SizedBox(height: 5.h,),
        Row(children: [
          Text(AppConstants.date,style: AppTextStyles.poppins(color: AppColors.grey787878.withOpacity(0.6), fontSize: 20.sp, weight: FontWeight.w600),),
          Text(date,style: eventStyle,),
        ],),
        SizedBox(height: 5.h,),
        Row(children: [
          Text(AppConstants.time,style: AppTextStyles.poppins(color: AppColors.grey787878.withOpacity(0.6), fontSize: 20.sp, weight: FontWeight.w600),),
          Text(time,style: eventStyle,),
        ],),
        SizedBox(height: 5.h,),
        Row(children: [
          Text(AppConstants.reminderTime,style: AppTextStyles.poppins(color: AppColors.grey787878.withOpacity(0.6), fontSize: 20.sp, weight: FontWeight.w600),),
          Text(remainderTime,style: eventStyle,),
        ],),
        SizedBox(height: 5.h,),
      ],)
    );
  }
}