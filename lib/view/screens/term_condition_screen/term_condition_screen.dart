import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            appBar: AppBars.settingsAppBar(context: context, title: AppConstants.termsAndConditions),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text:
                           AppConstants.termsThisPrivacy,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 7.h),
                    CustomText(
                      text: 'Information Collection & Use',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 7.h),
                    CustomText(
                        text:
                            'The Application collects information when you download and use it. This information may include information such as',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 3.h),
                    CustomText(
                        text:
                            '• Your device s public Internet protocol address (e.g. Public IP address)\n• The pages of the Application that you visit, the time and date of your visit, the time spent on those pages\n• The time spent on the Application\n• The operating system you use on your mobile device',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 3.h),
                    CustomText(
                        text:
                            'The Application does not gather precise information about the location of your mobile device.',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 3.h),
                    CustomText(
                        text:
                            'The Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions.For a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information, including but not limited to Email, user Id, age, gender and country. The information that the Service Provider request will be retained by them and used as described in this privacy policy.',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 7.h),
                    CustomText(
                      text: 'Third Party Access',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 7.h),
                    CustomText(
                        text:
                            'Only aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider may share your information with third parties in the ways that are described in this privacy statement.\nPlease note that the Application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                  ],
                ),
              ),
            )));
  }
}
