import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import '../../../main.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../../utilis/app_prefs.dart';
import '../../../utilis/app_routes.dart';
import '../../screens/bottom_screen.dart';
import '../custom_blue_container.dart';
import '../demo_screen.dart';

class Demo6Widget extends StatelessWidget {
  const Demo6Widget({
    super.key,
    required this.height,
    required this.width,
    required this.onWidgetTap,
    required this.onFinishedTap,
    required this.onHandIconTap,
  });

  final double height;
  final double width;
  final VoidCallback onWidgetTap;
  final VoidCallback onFinishedTap;
  final VoidCallback onHandIconTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onWidgetTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const BlurryHomeScreen(isShowIcon: true),
            // Image.asset(
            //   Asset.demo_6,
            //   height: height,
            //   width: width,
            //   fit: BoxFit.fill,
            // ),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.063) +
                    EdgeInsets.only(bottom: height * 0.1),
                child: CustomPaint(
                  size: Size(width * 0.78, height * 0.22),
                  painter: Demo6CustomPainter(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 2, right: 2, top: 10, bottom: 10),
                    child: SizedBox(
                      height: height * 0.15,
                      width: width * 0.78,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: AutoSizeText(AppConstants.demoPage6Text,
                                maxLines: 4,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.poppins(
                                  fontSize: height * 0.018,
                                  color: AppColors.whiteFFFFF,
                                  weight: FontWeight.w500,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: width * 0.015),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    DemoNextButton(
                                      text: AppConstants.finish,
                                      onTap: onFinishedTap,
                                    ),
                                    Positioned(
                                      top: height * 0.01,
                                      left: width * 0.07,
                                      child: GestureDetector(
                                        onTap: onHandIconTap,
                                        child: Image.asset(AppImages.iconNext,
                                            width: 55.w, height: 55.h),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: TempBottomNavigation(width: width),
            ),
          ],
        ),
      ),
    );
  }
}

class TempBottomNavigation extends StatelessWidget {
  const TempBottomNavigation({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67.h,
      width: width,
      decoration: BoxDecoration(
        border: const Border(
          top: BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
          left: BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
          right: BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        color: AppColors.whiteFFFFF,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.iconNotes, height: 30.h, width: 30.w),
          Image.asset(AppImages.iconHome, height: 30.h, width: 30.w),
          Image.asset(AppImages.iconCalender, height: 30.h, width: 30.w),
        ],
      ),
    );
  }
}
