import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_prefs.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view/demo_screen/demo_screen.dart';
import '../../main.dart';
import '../../services/permission_handler.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_images.dart';
import '../common_widgets/custom_app_bars.dart';
import '../common_widgets/custom_buttons.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;


  Future<void> _onNextPressed() async {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    } else {

      bool isNotificationAllowed = await PermissionHelper.checkAndRequestNotificationPermission(context: context);
     if(!isNotificationAllowed){
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
        backgroundColor: AppColors.whiteFFFFF,
        appBar: AppBars.authAppBars(bgColor: AppColors.whiteFFFFF, iconBrightness: Brightness.dark),
        body: Column(
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
                  width: 12.h,
                  height: 12.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ?  AppColors.primary
                        :  AppColors.greyLight.withOpacity(0.4),
                    //borderRadius: BorderRadius.circular(10.r),
                  ),
                );
              }),
            ),
            Container(
              width: double.infinity,
              height: 55.h,
              margin: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h,bottom: 35.h ),
              child: Buttons.customElevatedButton(title:  _currentPage == 2 ? AppConstants.getStarted : AppConstants.next,
                  backgroundColor: AppColors.primary, textColor: AppColors.whiteFFFFF, onPressed: _onNextPressed, isDisabled: false),
            )

          ],
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
             style: AppTextStyles.poppins(color: AppColors.skyBlue00AAEE, fontSize: 40.sp, weight: FontWeight.w700),
            ),
          ),
          // SizedBox(height: height * 0.06),
          Image.asset(
            imagePath,
           height: 1.sh * 0.4,
            width: 1.sw,
            fit: BoxFit.cover,
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
