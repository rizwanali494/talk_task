



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import 'package:talk_task/view/screens/notification_screen/notification_screen.dart';
import 'package:talk_task/view/screens/setting_screen/setting_screen.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_images.dart';
import '../common_widgets/custom_buttons.dart';


class HomeMenuDialogue extends StatelessWidget{
  const HomeMenuDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390.h,
      width: 200.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.r),

      ),
      child: Dialog(
        alignment: Alignment.topRight,
        backgroundColor: AppColors.whiteFFFFF,
     elevation: 2,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.r),side: BorderSide(color: AppColors.greyLight.withOpacity(0.1))),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _button(title: AppConstants.settings, onPressed: () {
                Navigator.of(context).push(MyRoute(const SettingScreen()));
              }, iconPath: AppImages.iconSettingsHome),
              _button(title: AppConstants.calenderSync, onPressed: () {  }, iconPath: AppImages.iconCalenderSync),
              _button(title: AppConstants.notifications, onPressed: () {
                Navigator.of(context).push(MyRoute(const NotificationScreen()));
              }, iconPath: AppImages.iconNotificationHome),
              _button(title: AppConstants.signOut, onPressed: () {  }, iconPath: AppImages.iconSignOut),
            ],),
        ),
      ),
    );
  }



   Widget _button({required String title,required VoidCallback ? onPressed,required String iconPath}){
    return  GestureDetector(
      onTap: onPressed,
      child: SizedBox(
          height: 45.h,
        child: Row(children: [
          Image.asset(iconPath,height: 23.h,color: AppColors.black,),
          SizedBox(width: 10.w,),
          CustomText(text: title,fontSize: 16.sp,fontWeight: FontWeight.w400,color: AppColors.black,),
          SizedBox(width: 10.w,)
        ],),
      ),
    );
  }

}