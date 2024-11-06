import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../custom_blue_container.dart';
import '../demo_screen.dart';


class Demo5Widget extends StatelessWidget {
  const Demo5Widget({
    super.key,
    required this.height,
    required this.width,
    required this.onWidgetTap,
    required this.onNextTap,
    required this.onSkipTap,
  });

  final double height;
  final double width;
  final VoidCallback onWidgetTap;
  final VoidCallback onNextTap;
  final VoidCallback onSkipTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onWidgetTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            // Image.asset(Asset.demo_5,
            //     height: height, width: width, fit: BoxFit.fill),
            const BlurryHomeScreen(isShowIcon: true),
            Positioned(
                top: 69.h,
                left: 13.w,
                child: GestureDetector(
                  onTap: onSkipTap,
                  child: SizedBox(
                    height: height * 0.04,
                    width: width * 0.15,
                    child: Image.asset(AppImages.iconSkip),
                  ),
                )),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w) +
                  EdgeInsets.only(top: height * 0.12),
              child: CustomPaint(
                size: Size(width * 0.78, height * 0.18),
                painter: Demo5CustomPainter(),
                child: SizedBox(
                  height: height * 0.15,
                  width: width * 0.6,
                  child: Padding(
                    padding: EdgeInsets.only(top: height * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: AutoSizeText(AppConstants.demoPage5Text,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.poppins(
                                fontSize: height * 0.018,
                                color: AppColors.whiteFFFFF,
                                weight: FontWeight.w500,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: width * 0.03, top: height * 0.015),
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
            ),

            Padding(
              padding: EdgeInsets.only(top: height * 0.24),
              child: GestureDetector(
                onTap: onNextTap,
                child: Image.asset(AppImages.iconNext, width: 51.w, height: 61.h),
              ),
            ),
            Positioned(
              top: height * 0.04,
              right: 13.w,
              child: GestureDetector(
                onTap: () {},
               child: Image.asset(AppImages.imgDemoSettings, width: 52.w, height: 61.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
