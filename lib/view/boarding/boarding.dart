import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/services/local_notification_service.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_prefs.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view/demo_screen/demo_screen.dart';
import '../../main.dart';
import '../../services/permission_handler.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_images.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  initState(){
    super.initState();
    PermissionHelper.checkAndRequestPermissions();
  }

  Future<void> _onNextPressed() async {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    } else {
     bool permissionsGranted=await PermissionHelper.checkAndRequestPermissions();
     if(!permissionsGranted){
       return;
     }
      await prefs.setBool(AppPrefs.onBoardingShown, true);
      Navigator.pushReplacement(context, MyRoute( const DemoScreen()));

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.skyBlueFFA6E5FF,
                AppColors.lightBlueBAEBFE,
                AppColors.whiteFFFFF
              ],
             // stops: [0.2, 0.92, 0.99999999],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    _buildPage(
                      context,
                      AppConstants.titleBoardingOne,
                      AppImages.imgBoardingFirst,
                    ),
                    _buildPage(
                      context,
                      AppConstants.titleBoardingTwo,
                      AppImages.imgBoardingSecond,
                    ),
                    _buildPage(
                      context,
                      AppConstants.titleBoardingThree,
                        AppImages.imgBoardingThird
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: _currentPage == index ? 21.w : 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ?  AppColors.darkBlue1642DB
                          :  AppColors.darkBlue1642DB.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  );
                }),
              ),
              Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 37.w, vertical: 33.h),
                  child: GestureDetector(
                    onTap: _onNextPressed,
                    child: Container(
                      width: double.infinity,
                      height: 56.h,
                      decoration: BoxDecoration(
                          color: AppColors.whiteFFFFF,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow:  [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.1),
                              //offset: const Offset(10, 10),
                              blurRadius: 4,
                              spreadRadius: 0.5,
                            ),
                          ]),
                      child: Center(
                        child: Text(
                    _currentPage == 2 ? AppConstants.getStarted : AppConstants.next,
                        style: AppTextStyles.poppins(color: AppColors.skyBlue00AAEE, fontSize: 24.sp, weight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, String title, String imagePath) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 32.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 1.sh * 0.24,
            child: Text(
              title,
             style: AppTextStyles.poppins(color: AppColors.whiteFFFFF, fontSize: 40.sp, weight: FontWeight.w500),
            ),
          ),
          // SizedBox(height: height * 0.06),
          Image.asset(
            imagePath,
            height: 1.sh * 0.4,
            width: 1.sw,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
