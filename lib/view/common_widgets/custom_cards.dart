


import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import '../../utilis/app_colors.dart';

class CustomCards{

  static TextStyle eventStyle=AppTextStyles.poppins(color: AppColors.grey787878.withOpacity(0.7), fontSize: 19.sp, weight: FontWeight.w400);

  static Widget eventCard({required String event,required String date,required String time,required String remainderTime}){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.w,vertical: 7.h),
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      decoration: BoxDecoration(
          color: AppColors.whiteFFFFF,
        boxShadow: const [BoxShadow(color: AppColors.blueBorder,spreadRadius: 1.0,blurRadius: 1.2)],
        borderRadius: BorderRadius.circular(14.r)
      ),
      child:Column(children: [
        SizedBox(height: 5.h,),
        Row(children: [
          CustomText(text: AppConstants.event,color: AppColors.grey787878.withOpacity(0.9), fontSize: 20.sp, fontWeight: FontWeight.w500),
          Container(
              width: 1.sw*0.7,
              child: Text(event,style: eventStyle,maxLines: 2,overflow: TextOverflow.ellipsis,)),
        ],),
        SizedBox(height: 5.h,),
        Row(children: [
          CustomText(text: AppConstants.date,color: AppColors.grey787878.withOpacity(0.9), fontSize: 20.sp, fontWeight: FontWeight.w500),
          Text(date,style: eventStyle,),
        ],),
        SizedBox(height: 5.h,),
        Row(children: [
          CustomText(text: AppConstants.time,color: AppColors.grey787878.withOpacity(0.9), fontSize: 20.sp, fontWeight: FontWeight.w500),
          Text(time,style: eventStyle,),
        ],),
        SizedBox(height: 5.h,),
        Row(children: [
          CustomText(text: AppConstants.reminderTime,color: AppColors.grey787878.withOpacity(0.9), fontSize: 20.sp, fontWeight: FontWeight.w500),
          Text(remainderTime,style: eventStyle,),
        ],),
        SizedBox(height: 5.h,),
      ],)
    );
  }
}