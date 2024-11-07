import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../../view_model/call_picking_provider.dart';
import '../../common_widgets/custom_app_bars.dart';

class RemainderCall extends StatelessWidget {
  final String time;
  final String date;
  const RemainderCall({super.key,required this.date,required this.time});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBars.authAppBars(bgColor: AppColors.blue05AAEC, iconBrightness: Brightness.dark),
      body: Consumer<CallPickingProvider>(builder: (BuildContext context,  value, Widget? child) {
        if(!value.callPicked){return _callIncoming(context);}
        else if(value.callPicked){return _callPicked(context);}
        return const SizedBox();
      },
      )
    );
  }

  Widget _callIncoming(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        height: 1.sh,
        decoration:  const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.blue05AAEC,
            AppColors.blueLightA5E5FF,
            AppColors.blue05AAEC,
          ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
        ),
        child: Column(children: [
          SizedBox(height: 20.h,),
          Center(child: CustomText(text: AppConstants.remainderCall,fontSize: 20.sp,fontWeight: FontWeight.w600,color: AppColors.blueDark002055.withOpacity(0.8),)),
          SizedBox(height: 20.h,),
          Center(child: CustomText(text: date,fontSize: 20.sp,fontWeight: FontWeight.w600,color: AppColors.whiteFFFFF,)),
          Center(child: CustomText(text: time,fontSize: 45.sp,fontWeight: FontWeight.w600,color: AppColors.whiteFFFFF,)),
          Center(child: CustomText(text: AppConstants.dontForget,fontSize: 20.sp,fontWeight: FontWeight.w600,color: AppColors.whiteFFFFF.withOpacity(0.7),)),
          Lottie.asset(AppImages.imgCallLottie,height: 1.sh*0.55),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  _callButtons(onPressed: (){
                    context.read<CallPickingProvider>().endCall();
                    Navigator.of(context).pop();
                  }, icon: AppImages.iconCross, bgColor: AppColors.redFF0000),
                  CustomText(text: AppConstants.reject,fontSize: 16.sp,fontWeight: FontWeight.w500),
                ],
              ),
              Column(
                children: [
                  _callButtons(onPressed: (){
                    context.read<CallPickingProvider>().setCallStatus(true);
                  }, icon: AppImages.iconTick, bgColor: AppColors.green05E700),
                  SizedBox(height: 2.h,),
                  CustomText(text: AppConstants.accept,fontSize: 16.sp,fontWeight: FontWeight.w500,),
                ],
              ),
            ],)
        ],),
      ),
    );
  }




  Widget _callButtons({required Color bgColor,required String icon,required GestureTapCallback ? onPressed}){
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(25.r),
      child: Container(
        height: 60.h,
        width: 60.h,
        clipBehavior: Clip.antiAlias,
        decoration:  BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle
        ),
        child: Padding(
          padding:  EdgeInsets.all(8.r),
          child: Image.asset(icon,),
        ),
      ),
    );
  }


  Widget _callPicked(BuildContext context){
   return SingleChildScrollView(
     child: Container(
       height: 1.sh,
       decoration:  const BoxDecoration(
         gradient: LinearGradient(colors: [
           AppColors.blue05AAEC,
           AppColors.blueLightA5E5FF,
           AppColors.blue05AAEC,
         ],begin: Alignment.topCenter,end: Alignment.bottomCenter),
       ),
       child: Column(children: [
         SizedBox(height: 1.sh*0.1,),
         Center(child: CustomText(text: AppConstants.onGoing,fontSize: 24.sp,fontWeight: FontWeight.w600,color: AppColors.whiteFFFFF,)),
         SizedBox(height: 20.h,),
         StreamBuilder(stream: TimerStream.getTimerStream(), builder: (context,snap){
           if(snap.connectionState==ConnectionState.waiting){
             return CustomText(text: "00:00",fontSize: 20.sp,color: AppColors.whiteFFFFF,fontWeight: FontWeight.w500,);
           }
           return  CustomText(text: snap.data.toString(),fontSize: 20.sp,color: AppColors.whiteFFFFF,fontWeight: FontWeight.w500,);;
         }),
         Lottie.asset(AppImages.imgCallLottie,height: 1.sh*0.55),
         SizedBox(height: 30.h,),
         _callButtons(onPressed: (){
           context.read<CallPickingProvider>().endCall();
           Navigator.of(context).pop();
         }, icon: AppImages.iconEndCall, bgColor: AppColors.redFF0000),
       ],),
     ),
   );
  }
}




class TimerStream {
  static Stream<String> getTimerStream() {
    int seconds = 0; 
    return Stream.periodic(const Duration(seconds: 1), (count) {
      seconds = count;
      int minutes = seconds ~/ 60;
      int remainingSeconds = seconds % 60;
      return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    });
  }
}
