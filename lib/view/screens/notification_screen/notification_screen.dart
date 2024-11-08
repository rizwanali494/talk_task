import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_buttons.dart';


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
          _cardNotification(iconPath: AppImages.iconCheck, title: 'Event Successfully Uploaded', time: 'Recently'),

        ],
      ),
    );
  }




  Widget _cardNotification({required String iconPath,required String title,required String time}){
    return ListTile(
      title:CustomText(text: title,fontSize: 16.sp,fontWeight: FontWeight.w600,) ,
      subtitle:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: time,fontWeight: FontWeight.w400,color: AppColors.grey787878,fontSize: 15.sp,),
          Container(
              height: 30.h,
              child: Buttons.textButton(title: AppConstants.clickHereToView, onPressed: () {  }))
        ],
      ),
      leading:  Container(height: 60.h,width: 60.h,
        clipBehavior: Clip.antiAlias,
        decoration:  const BoxDecoration(
            color: AppColors.skyBlueF5F5FF,
            shape: BoxShape.circle
        ),
        child:Padding(
          padding:  EdgeInsets.all(13.r),
          child: Image.asset(iconPath),
        ) ,
      ) ,
    );
  }


}
