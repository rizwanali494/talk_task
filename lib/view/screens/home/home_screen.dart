
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view/common_widgets/custom_cards.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../common_widgets/custom_buttons.dart';
import '../../common_widgets/custom_text_fields.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteFFFFF,
      appBar:_topBar() ,
    body:_body() ,
    );
  }



  //top appbar
  AppBar _topBar(){
    return AppBar(
      backgroundColor: AppColors.whiteFFFFF,
      flexibleSpace: Padding(
        padding:  EdgeInsets.only(top: 8.h),
        child: Row(
          children: [
            SizedBox(width: 20.w,),
            Text(AppConstants.taskAi,style: AppTextStyles.poppins(color: AppColors.blueDark002055, fontSize: 20.sp, weight: FontWeight.w700),),
            const Spacer(),
            Container(
              height: 45.h,
              width:45.h ,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle
              ),
              child: Image.asset(AppImages.iconNotifications,),
            ),
            SizedBox(width: 20.w,),
          ],),
      ),

    );
  }



  //body

Widget _body(){
 return SingleChildScrollView(
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
     _cardAddEvent(),
     Padding(
       padding:  EdgeInsets.only(left: 16.w),
       child: CustomText(text: AppConstants.upcomingEvents,fontWeight: FontWeight.w700,fontSize: 20.sp,),
       
     ),
      SizedBox(height: 5.h,),
       CustomCards.eventCard(event: 'Study', date: "22/12/2024", time: '6:00 am', remainderTime: "04:00 am")
   ],),
 );
}


Widget _cardAddEvent(){
  return Container(
    height: 1.sh*0.63,
    margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.whiteFFFFF,
        boxShadow: const [BoxShadow(color: AppColors.blueBorder,spreadRadius: 0.4,blurRadius: 1.0)]
    ),
    child: SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 13.w),
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h,),
            Center(child: Text(AppConstants.addTask,style: AppTextStyles.poppins(color: AppColors.blueDark002055, fontSize: 20.sp, weight: FontWeight.w700),))
            , Image.asset(AppImages.iconMicrophone,height: 200.h,color: AppColors.secondary,)
            ,  CustomFields.field(title: AppConstants.event, onPressed: (){})
            ,  CustomFields.field(title: AppConstants.date, onPressed: (){})
            ,  CustomFields.field(title: AppConstants.time, onPressed: (){})
            ,  CustomFields.field(title: AppConstants.reminderTime, onPressed: (){}),
            SizedBox(height: 8.h,)
            ,SizedBox(
                width: 1.sw*0.9,
                child: Buttons.customElevatedButton(title: AppConstants.addEvent, backgroundColor: AppColors.greyDark6C6D6D.withOpacity(0.5), textColor: AppColors.whiteFFFFF, onPressed: (){}))
          ],),
      ),
    ),
  );
}





}
