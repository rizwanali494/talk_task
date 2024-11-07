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
import '../../common_widgets/custom_text.dart';
import '../../screens/bottom_screen.dart';
import '../custom_blue_container.dart';
import '../demo_screen.dart';


class Demo3Widget extends StatelessWidget {
  const Demo3Widget({
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
            // Image.asset(
            //   Asset.demo_3,
            //   height: height,
            //   width: width,
            //   fit: BoxFit.fill,
            // ),
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
              padding: EdgeInsets.only(bottom: height * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomPaint(
                    size: Size(
                      width * 0.8,
                      height * 0.135,
                    ),
                    painter: Demo6CustomPainter(),
                    child: SizedBox(
                      height: height * 0.135,
                      width: width * 0.8,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
                                child: Text(AppConstants.demoPage3Text,
                                    // maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.poppins(
                                      fontSize: height * 0.018,
                                      color: AppColors.whiteFFFFF,
                                      weight: FontWeight.w500,
                                    )),
                                // AutoSizeText(demoPage3Text,
                                //     maxLines: 3,
                                //     textAlign: TextAlign.center,
                                //     style: GoogleFonts.poppins(
                                //       fontSize: height * 0.018,
                                //       color: whiteColor,
                                //       fontWeight: FontWeight.w500,
                                //     )),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.01,
                                    right: width * 0.02,
                                    bottom: height * 0.02),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: DemoNextButton(
                                        text: AppConstants.next, onTap: onNextTap)),
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: height * 0.02,
                            // right: width * 0.0,
                            child: GestureDetector(
                              onTap: onHandIconTap,
                              child: Image.asset(AppImages.iconNext,
                                  width: 33.w, height: 33.h),
                            ),
                          )
                          // Padding(
                          //   padding: EdgeInsets.only(
                          //       top: height * 0.08, right: width * 0.05),
                          //   child: GestureDetector(
                          //     onTap: onHandIconTap,
                          //     child: const HandIcon(),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: AppConstants.upcomingEvents,
                          fontSize: height * 0.028,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteFFFFF),
                      const SizedBox(height: 10),
                      Container(
                        height: height * 0.15,
                        width: width * 0.85,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.whiteFFFFF,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextRow(
                              text: AppConstants.event,
                              text2: "Doctor's appointment with Doc...",
                            ),
                            TextRow(
                              text: AppConstants.date,
                              text2: "7/16/25",
                            ),
                            TextRow(
                              text: AppConstants.time,
                              text2: "4:00 pm",
                            ),
                            TextRow(
                              text: AppConstants.reminderTime,
                              text2: "2:00 am",
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  const TextRow({
    super.key,
    required this.text,
    required this.text2,
  });
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return Row(
      children: [
        AutoSizeText(text,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: AppTextStyles.poppins(
              fontSize: height * 0.020,
              color: AppColors.grey848A94,
              weight: FontWeight.w500,
            )),
        CustomText(
          text: text2,
          fontSize: height * 0.018,
          fontWeight: FontWeight.w500,
          color: AppColors.grey848A94,
        )
      ],
    );
  }
}
