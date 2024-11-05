import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import '../../../utilis/app_colors.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_text.dart';


class PrivacyScreen extends StatelessWidget{
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBars.settingsAppBar(context: context, title: AppConstants.privacyPolicy),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text:
                        AppConstants.privacyPolicyThis,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 7.h),
                    CustomText(
                      text: AppConstants.privacyPolicyInformation,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 7.h),
                    CustomText(
                        text:
                           AppConstants.privacyPolicyApplication,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 3.h),
                    CustomText(
                        text:
                           AppConstants.privacyPolicyYourDevice,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 3.h),
                    CustomText(
                        text:
                         AppConstants.privacyPolicyApplicationDoes,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 3.h),
                    CustomText(
                        text:
                          AppConstants.privacyPolicyService,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 7.h),
                    CustomText(
                      text: AppConstants.privacyPolicyService,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 7.h),
                    CustomText(
                        text:
                            AppConstants.privacyOnlyAggregated,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                  ],
                ),
              ),
            )));
  }
}
