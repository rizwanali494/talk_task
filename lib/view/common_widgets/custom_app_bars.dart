import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_images.dart';
import 'custom_buttons.dart';
import 'custom_text.dart';

class AppBars {
  static AppBar authAppBars(
      {required Color bgColor, required Brightness iconBrightness}) {
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: bgColor, statusBarIconBrightness: iconBrightness),
    );
  }

  static AppBar settingsAppBar(
      {required BuildContext context, required String title}) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteFFFFF,
      shadowColor: AppColors.transparent,
      surfaceTintColor: AppColors.whiteFFFFF,
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: AppColors.whiteFFFFF),
      title: Container(
        color: AppColors.whiteFFFFF,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Buttons.customIconButton(onPressed: (){
             Navigator.pop(context);
           }, icon: AppImages.iconBack),

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



  static AppBar appBarHomeScreens({required String title,required String leadingBtnIcon,required String trailingBtnIcon,
    required GestureTapCallback? leadingOnpressed,required GestureTapCallback? tailingOnpressed}) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteFFFFF,
      shadowColor: AppColors.transparent,
      surfaceTintColor: AppColors.whiteFFFFF,
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: AppColors.whiteFFFFF),
      flexibleSpace: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Row(
          children: [
            SizedBox(width: 12.w,),
            CustomText(text: title,fontSize: 20.sp,fontWeight: FontWeight.w700,color: AppColors.blueDark002055,),
            const Spacer(),
            Padding(
              padding:  EdgeInsets.only(left: 13.w),
              child: Buttons.customIconButton(onPressed: leadingOnpressed, icon: leadingBtnIcon),
            ),
            SizedBox(width: 7.w,),
            Padding(
              padding:  EdgeInsets.only(right: 13.w),
              child: Buttons.customIconButton(onPressed: tailingOnpressed, icon: trailingBtnIcon),
            ),
            SizedBox(width: 10.w,),

          ],
        ),
      ),
    );
  }
}
