import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/main.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_prefs.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/view/screens/bottom_screen.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../common_widgets/custom_text.dart';
import '../demo_screen.dart';

class Demo1Widget extends StatelessWidget {
  const Demo1Widget({
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
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const BlurryHomeScreen(isShowIcon: false),
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
            SizedBox(
              height: height,
              width: width,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.15),
                child: Column(
                  children: [
                    CustomText(text: AppConstants.addTask,color: AppColors.whiteFFFFF,
                      fontSize: 19.sp,fontWeight: FontWeight.w600,),
                     SizedBox(height: 10.h,),
                     Image.asset(AppImages.iconMicrophone,color: AppColors.whiteFFFFF,
                         height: height * 0.2, width: width * 0.4),
                    Stack(
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: height * 0.2,
                                width: width * 0.8,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: CustomText(
                                  text:
                                    AppConstants.demoWidgetOne,
                                  fontSize: 14.sp,
                                  color: AppColors.whiteFFFFF,
                                  // textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                )),
                            Positioned(
                              top: 0,
                              child: CustomPaint(
                                size: const Size(50, 10),
                                painter: TrianglePainter(),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 14.h,
                          right: 8.w,
                          child: GestureDetector(
                              onTap: onNextTap,
                              child: Container(
                                height: height * 0.03,
                                width: width * 0.15,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: AppConstants.next,
                                    fontSize: height * 0.016,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: onHandIconTap,
                            child: Image.asset(AppImages.iconNext,
                                width: 33.w, height: 33.h),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
