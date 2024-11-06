
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_text_styles.dart';

class CustomFields{

 static Widget field({required String title,required Function? onPressed}){
    return Column(children: [
      Text(title,style: AppTextStyles.poppins(color: AppColors.grey787878, fontSize: 17.sp, weight: FontWeight.w600),),
       SizedBox(height: 4.h,),
       SizedBox(
         height: 45.h,
         child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(13.r)
            )
          ),
               ),
       )

    ],);


  }
}