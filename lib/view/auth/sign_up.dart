import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_constants.dart';
import '../../utilis/app_images.dart';
import '../common_widgets/custom_app_bars.dart';
import 'create_user.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteFFFFF,
      appBar: AppBars.authAppBars(
          bgColor: AppColors.whiteFFFFF, iconBrightness: Brightness.dark),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SizedBox(
              height: 1.sh*0.94,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Center(
                      child: Image.asset(
                    AppImages.iconAppLogo,
                    height: 1.sh * 0.18,
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: CustomText(
                    text: AppConstants.taskAi,
                    fontSize: 26.sp,
                    color: AppColors.blueDark002055,
                    fontWeight: FontWeight.bold,
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: CustomText(
                          text: AppConstants.simplyfyRemainders,
                          fontSize: 24.sp,
                          color: AppColors.blueDark002055,
                          fontWeight: FontWeight.w700)),
                  const Spacer(),
                  _continueButton(
                      title: AppConstants.continueWithGoogle,
                      onPressed: () {},
                      icon: AppImages.iconGoogle),
                  SizedBox(
                    height: 13.h,
                  ),
                  _continueButton(
                      title: AppConstants.continueWithApple,
                      onPressed: () {},
                      icon: AppImages.iconApple),
                  SizedBox(
                    height: 13.h,
                  ),
                  _continueButton(
                      title: AppConstants.continueWithEmail,
                      onPressed: () {
                        Navigator.push(context, MyRoute( CreateUserName()));
                      },
                      icon: AppImages.iconMail),
                  const Spacer(),
                  _endingText(),
                  SizedBox(
                    height: 30.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _continueButton(
      {required String title,
      required VoidCallback onPressed,
      required String icon}) {
    return Container(
      height: 53.h,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: AppColors.greyLight, spreadRadius: 0.5, blurRadius: 1.4)
      ], borderRadius: BorderRadius.circular(7.r)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.whiteFFFFF,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r))),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7.w),
                height: 37.h,
                width: 37.h,
                child: Image.asset(
                  icon,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              CustomText(
                text: title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox()
            ],
          )),
    );
  }

  Widget _endingText() {
    return RichText(
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 4,
      text: TextSpan(
          text: AppConstants.byContinuingYouAgree,
          style: AppTextStyles.poppins(
              color: AppColors.black, fontSize: 14.sp, weight: FontWeight.w500),
          children: [
            _customTextTitles(
                title: AppConstants.termsOfServices,
                shouldUnderline: true,
                textColor: AppColors.primary),
            _customTextTitles(
                title: AppConstants.and,
                shouldUnderline: false,
                textColor: AppColors.black),
            _customTextTitles(
                title: AppConstants.privacyPolicy,
                shouldUnderline: true,
                textColor: AppColors.primary),
          ]),
    );
  }

  TextSpan _customTextTitles(
      {required String title,
      required bool shouldUnderline,
      required Color textColor}) {
    return TextSpan(
        text: title,
        style: AppTextStyles.poppins(
            shouldUnderline: shouldUnderline,
            color: textColor,
            height: 1.5,
            fontSize: 14.sp,
            weight: FontWeight.w500));
  }
}
