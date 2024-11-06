import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_text_styles.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_text.dart';


class PrivacyScreen extends StatelessWidget{
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteFFFFF,
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
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,

                    ),
                    SizedBox(height: 7.h),
                    CustomText(
                        text:
                            AppConstants.privacyOnlyAggregated,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),

                    //Opt Out Rights
                    _simpleHeadingValue(title: AppConstants.optOutRights, description:  AppConstants.optOutRightsDescription),

                    //Data Retention
                    _simpleHeadingValue(title: AppConstants.dataRetention, description:  AppConstants.dataRetentionDescription),

                    //Children
                    _simpleHeadingValue(title: AppConstants.children, description:  AppConstants.childrenDescription),


                    //Security
                    _simpleHeadingValue(title: AppConstants.security, description:  AppConstants.securityDescription),

                    //Changes
                    _simpleHeadingValue(title: AppConstants.changes, description:  AppConstants.changesDescription),

                    //Your Consent
                    _simpleHeadingValue(title: AppConstants.yourConsent, description:  AppConstants.yourConsentDescription),


                    //Contact Us
                    _simpleHeadingValue(title:AppConstants.contactUs , description:  AppConstants.contactUsFirst,),

                    SizedBox(height: 3.h),
                    Text( AppConstants.contactUsEmail,style: AppTextStyles.poppins(
                        shouldUnderline: true,
                        color: AppColors.black, fontSize: 16.sp,weight: FontWeight.w300),)
                    ,
                    SizedBox(height: 3.h),

                    CustomText(
                        text:
                        AppConstants.contactUsSecond,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 3.h),
                  ],
                ),
              ),
            )));
  }



  Widget _simpleHeadingValue({required String title,required String description}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(height: 3.h),
      CustomText(
        text:
        title,
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,),
      SizedBox(height: 3.h),
      CustomText(
          text:
          description,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300),
    ],);
  }
}

