
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:talk_task/main.dart';
import 'package:talk_task/services/hive_service.dart';
import 'package:talk_task/utilis/app_colors.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_images.dart';
import 'package:talk_task/utilis/app_prefs.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/utilis/customize_easyloading.dart';
import 'package:talk_task/view/boarding/boarding.dart';
import 'package:talk_task/view/common_widgets/custom_app_bars.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import 'package:talk_task/view/demo_screen/demo_screen.dart';
import 'package:talk_task/view/screens/bottom_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    CustomizeEasyLoading.customizeEasyLoading();
    Future.delayed(const Duration(seconds: 3), (){
      _startingPagesTransition();
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteFFFFF,
      appBar: AppBars.authAppBars(bgColor: AppColors.whiteFFFFF, iconBrightness: Brightness.dark),
      body: SizedBox(
          height: 1.sh,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 150.h,
              width: 150.h,
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
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  colors: [AppColors.blueLightA5E5FF, AppColors.primary, AppColors.blue05AAEC], // Gradient colors
                  tileMode: TileMode.mirror, // Optional, defines how the gradient tiles
                ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
              },
              child: Text( AppConstants.task+AppConstants.ai, style: AppTextStyles.righteous(fontSize: 37.sp,
                color: AppColors.primary,
                weight: FontWeight.w500,),),
            ),
            const Spacer(),
        SpinKitFadingCircle(
          size: 50.h,
          itemBuilder: (context, index) {
            return Container(
              height: 30,
              width: 10,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        ),

            SizedBox(
              height: 75.h,
            ),
          ],
        ),
      ),
    );
  }


  void _startingPagesTransition(){
    //if On boarding screens has been seen then move to DemoScreen
    if(prefs.getBool(AppPrefs.onBoardingShown)==true && prefs.getBool(AppPrefs.onDemoShown)==true ){
      Navigator.pushReplacement(context, MyRoute( BottomScreen()));
    }
    else if(prefs.getBool(AppPrefs.onBoardingShown)==true && prefs.getBool(AppPrefs.onDemoShown)==null){
      Navigator.pushReplacement(context, MyRoute( const DemoScreen()));
    }
    else{
      Navigator.pushReplacement(context, MyRoute(const OnboardingScreen()));
    }

  }

}
