import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import '../../../utilis/app_colors.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_text.dart';


class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  static final  List<Map<String, String>> items = [
    {
      "bullet": "•",
      "text": "Easily add events by speaking into the microphone.",
      "bold": "Voice Input: "
    },
    {
      "bullet": "•",
      "text": "Manually add and edit events, dates, and reminders.",
      "bold": "Manual Input: "
    },
    {
      "bullet": "•",
      "text":
          "Stay updated with notifications for successfully added events and archived reminders.",
      "bold": "Notifications: "
    },
    {
      "bullet": "•",
      "text":
          "Receive reminders through phone calls, ensuring you never miss an important task.",
      "bold": "Phone Call Reminders: "
    },
    {
      "bullet": "•",
      "text": "Automatically set reminders for daily tasks for the next day.",
      "bold": "Daily Reminders: "
    },
    {
      "bullet": "•",
      "text": "Navigate and manage your calendar with ease.",
      "bold": "User-Friendly Interface: "
    },
    {
      "bullet": "•",
      "text": "Stay tuned for additional features and improvements!",
      "bold": "More to Come: "
    },
  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBars.settingsAppBar(context: context, title: AppConstants.aboutUs),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text:
                        AppConstants.aboutUsWelcome,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 5.h),
                    CustomText(
                      text: AppConstants.ourMission,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                        text:
                           AppConstants.aboutUsAtTask,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                    SizedBox(height: 5.h),
                    CustomText(
                      text: AppConstants.features,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 5.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items.map((item) {
                        return RichText(
                          // textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${item["bullet"]} ',
                                style: AppTextStyles.poppins(
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                   weight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: item["bold"],
                                style:AppTextStyles.poppins(
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                  weight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: item["text"],
                                style: AppTextStyles.poppins(
                                  fontSize: 16.sp,
                                  color: AppColors.black,
                                  weight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                      text: AppConstants.whyChooseUs,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                        text:
                          AppConstants.aboutUsWeUnderstand,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300),
                  ],
                ),
              ),
            )));
  }
}
