
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_constants.dart';
import '../common_widgets/custom_buttons.dart';
import '../common_widgets/custom_text.dart';

class MessageDialogue extends StatelessWidget{
  final String title;
  const MessageDialogue({super.key, required this.title, });

  @override
  Widget build(BuildContext context) {
    return Dialog(

      backgroundColor: AppColors.whiteFFFFF,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r)),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 20.h,
                child: IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: const Icon(Icons.close),color: AppColors.grey787878,),
              ),
            ),
            Container(
              height: 60.h,
              width: 60.h,
              margin: EdgeInsets.only(bottom: 13.h),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blue05AAEC,

              ),
              child: Padding(
                padding:  EdgeInsets.all(16.r),
                child: Icon(Icons.info,size: 27.h,color: AppColors.whiteFFFFF,),
              ),
            ),
            CustomText(text: AppConstants.permissionRequired,color: AppColors.blueDark002055,
              fontSize: 18.sp,fontWeight: FontWeight.bold,),
            SizedBox(height: 10.h,),
            CustomText(text: title,color: AppColors.blueDark002055,
              fontSize: 16.sp,fontWeight: FontWeight.w500,textAlign: TextAlign.center,),
            SizedBox(height: 20.h,),
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: Buttons.customElevatedButton(title: AppConstants.ok,
                  backgroundColor: AppColors.blue05AAEC, textColor: AppColors.whiteFFFFF,
                  onPressed: (){
                Navigator.of(context).pop();
                  }, isDisabled: false),
            ),
            SizedBox(height: 12.h,),
          ],),
      ),
    );
  }

}