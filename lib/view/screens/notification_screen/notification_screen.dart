import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../common_widgets/custom_app_bars.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteFFFFF,
      appBar: AppBars.settingsAppBar(
          context: context, title: AppConstants.notification),
      body:ListView(
        children: [
          _notificationCard(iconPath: AppImages.iconCheck, title: 'Event Successfully Uploaded'),
        ],
      ),
    );
  }



    Widget _notificationCard({required String iconPath,required String title}){
    return Row(children: [
      SizedBox(width: 10.w,),
      Container(height: 73.h,width: 73.h,
      clipBehavior: Clip.antiAlias,
      decoration:  const BoxDecoration(
        color: AppColors.skyBlueF5F5FF,
        shape: BoxShape.circle
      ),
        child:Padding(
          padding:  EdgeInsets.all(18.r),
          child: Image.asset(iconPath),
        ) ,
      ),
      SizedBox(width: 10.w,),
      Container(child: CustomText(text: title,fontSize: 16.sp,fontWeight: FontWeight.w600,),)
    ],);
    }

}
