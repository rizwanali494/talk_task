import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_constants.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_text.dart';


class TermConditionScreen extends StatelessWidget {
  const TermConditionScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteFFFFF,
            appBar: AppBars.settingsAppBar(context: context, title: AppConstants.termsAndConditions),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text:
                           AppConstants.termsAndConditionsOne,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                   // SizedBox(height: 2.h),
                    CustomText(
                        text:
                        AppConstants.googlePlayServices,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),

                    //SizedBox(height: 2.h),
                    CustomText(
                        text:
                        AppConstants.termsAndConditionsThree,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    CustomText(
                      text: AppConstants.changesToTheseTerms,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 7.h),
                    CustomText(
                        text:
                          AppConstants.termsAndConditionsUpdate,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 3.h),
                    CustomText(
                        text:
                           AppConstants.contactUs,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,),
                    SizedBox(height: 3.h),
                    CustomText(
                        text:
                           AppConstants.contactUsFirst,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
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
}
