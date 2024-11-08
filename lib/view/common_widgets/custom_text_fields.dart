
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_text_styles.dart';

class CustomFields{

 static Widget field({required String title,required GestureTapCallback? onPressed, bool isReadOnly=true,required TextEditingController controller}){
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 3.h),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding:  EdgeInsets.only(left: 4.w),
            child: Text(title,style: AppTextStyles.poppins(color: AppColors.grey787878, fontSize: 17.sp, weight: FontWeight.w400),),
          ),
           SizedBox(height: 4.h,),
           SizedBox(
             height: 45.h,
             child: TextField(
              readOnly: isReadOnly,
              style: AppTextStyles.poppins(color: AppColors.black, fontSize: 15.sp, weight: FontWeight.w400),
              controller: controller,
              cursorColor: AppColors.secondary,
              onTap: onPressed,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0.8,color: AppColors.blueBorder),
                   borderRadius: BorderRadius.circular(15.r)
                ),
                enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(width: 0.8,color: AppColors.blueBorder),
                    borderRadius: BorderRadius.circular(15.r)
                ),
                focusedBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(width: 0.8,color: AppColors.blueBorder),
                    borderRadius: BorderRadius.circular(15.r)
                )
              ),
                   ),
           )

        ],),
      ),
    );


  }
}