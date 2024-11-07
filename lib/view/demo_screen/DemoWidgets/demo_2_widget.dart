import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/main.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../../utilis/app_prefs.dart';
import '../../../utilis/app_routes.dart';
import '../../common_widgets/custom_text.dart';
import '../../screens/bottom_screen.dart';
import '../custom_blue_container.dart';
import '../demo_screen.dart';

class Demo2Widget extends StatelessWidget {
  const Demo2Widget({
    super.key,
    required this.height,
    required this.width,
    required this.onWidgetTap,
    required this.onNextTap,
    required this.onHandIconTap,
  });

  final double height;
  final double width;
  final VoidCallback onWidgetTap;
  final VoidCallback onNextTap;
  final VoidCallback onHandIconTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onWidgetTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const BlurryHomeScreen(isShowIcon: true),
          Positioned(
              top: 69.h,
              left: 13.w,
              child: GestureDetector(
                onTap: () async {
                  Navigator.pushReplacement(context, MyRoute(BottomScreen()));
                  prefs.setBool(AppPrefs.onDemoShown, true);

                },
                child: SizedBox(
                  height: height * 0.04,
                  width: width * 0.15,
                  child: Image.asset(AppImages.iconSkip),
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.065),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: AppConstants.event,
                    fontSize: height * 0.020,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteFFFFF),
                const SizedBox(height: 5),
                Container(
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: AppColors.whiteFFFFF,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(
                    text: AppConstants.date,
                    fontSize: height * 0.020,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteFFFFF),
                const SizedBox(height: 5),
                Container(
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: AppColors.whiteFFFFF,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(
                    text: AppConstants.time,
                    fontSize: height * 0.020,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteFFFFF),
                const SizedBox(height: 5),
                Container(
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: AppColors.whiteFFFFF,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 10),
                CustomText(
                    text: AppConstants.reminderTime,
                    fontSize: height * 0.020,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteFFFFF),
                const SizedBox(height: 5),
                Container(
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: AppColors.whiteFFFFF,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.6),
            child: CustomPaint(
              size: const Size(50, 10),
              painter: Demo2CustomPainter(),
              child: SizedBox(
                height: height * 0.18,
                width: width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2) +
                          const EdgeInsets.only(top: 20),
                      child: AutoSizeText(AppConstants.demoPage2Text,
                          maxLines: 4,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.poppins(
                            fontSize: height * 0.018,
                            color: AppColors.whiteFFFFF,
                            weight: FontWeight.w500,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.02, top: 10.h),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: DemoNextButton(
                            text: AppConstants.next,
                            onTap: onNextTap,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: height * 0.1,
            right: width * 0.1,
            child: GestureDetector(
              onTap: onHandIconTap,
              child: Image.asset(AppImages.iconNext, width: 33.w, height: 33.h),
            ),
          )
          // Padding(
          //     padding: EdgeInsets.only(top: height * 0.8, left: width * 0.69),
          //     child: GestureDetector(
          //         onTap: onHandIconTap, child: const HandIcon())),
        ],
      ),
    );
  }
}
