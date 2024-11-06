
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:talk_task/utilis/app_colors.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_images.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view/boarding/boarding.dart';
import 'package:talk_task/view/common_widgets/custom_app_bars.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
       Navigator.pushReplacement(context, MyRoute(const OnboardingScreen()));
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.authAppBars(bgColor: AppColors.primary, iconBrightness: Brightness.dark),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColors.whiteFFFFF,
          gradient: LinearGradient(
            colors: [
               AppColors.primary,
              AppColors.skyBlueFFA6E5FF,
               AppColors.lightBlueBAEBFE,
              AppColors.whiteFFFFF
              
            ],
           // stops: [0.23, 0.82, 0.97],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 180.h,
              width: 180.h,
              child: Center(
                child: Image.asset(
                //  fit: BoxFit.fill,
                  AppImages.imgSplash,
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Text(
              AppConstants.taskUp,
              style: AppTextStyles.righteous(
                fontSize: 35.sp,
                color: AppColors.darkBlue1642DB,
                 weight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 150.h,
            ),
             SpinKitFadingCircle(
               color: AppColors.darkBlue1642DB,
              size: 50.h,
            ),
            SizedBox(
              height: 75.h,
            ),
          ],
        ),
      ),
    );
  }


}