import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_constants.dart';
import '../../../utilis/app_images.dart';
import '../../../view_model/customization_screen_provider.dart';
import '../../../view_model/setting_provider.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_text.dart';


class CustomizationScreen extends StatefulWidget {
  const CustomizationScreen({super.key});

  @override
  State<CustomizationScreen> createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    WidgetsBinding.instance.addPostFrameCallback((d){
      Provider.of<CustomizationProvider>(context, listen: false).fetchColors();
    });
  }

  @override
  Widget build(BuildContext context) {
    var customizationProvider = Provider.of<CustomizationProvider>(context);
    return customizationProvider.isLoading
                ? const Center(
                    child: SpinKitCircle(
                      color: Color(0xFF1642DB),
                      size: 50.0,
                    ),
                  )
                :SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteFFFFF,
            appBar: AppBars.settingsAppBar(context: context, title: AppConstants.customization),
            body:  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 25.h, horizontal: 25.w),
                      child: Consumer<SettingProvider>(
                          builder: (context, model, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                AppImages.imgCustomize,
                                height: 130.h,
                                width: 1300.w,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CustomText(
                              text:
                              AppConstants.customizationTitle,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 69.h),
                            CustomText(
                              text: AppConstants.customizationCalender,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(height: 20.h),

                            Column(
                              children: List.generate(
                                3,
                                (index) => Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         ChangeEventColorScreen(
                                        //       eventCount:
                                        //           (index + 1).toString(),
                                        //     ),
                                        //   ),
                                        // );
                                      },
                                      child: Container(
                                        height: 110.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border:
                                              Border.all(color: AppColors.blueBorder),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w, vertical: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 140.w,
                                                    child: CustomText(
                                                        text: AppConstants.eventDays,
                                                        fontSize: 22.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    width: 140.w,
                                                    child: CustomText(
                                                      text: index == 2
                                                          ? '${index + 1} ${AppConstants.events}'
                                                          : (index + 1)
                                                                  .toString() +
                                                              (index == 0
                                                                  ? AppConstants.eventCustomize
                                                                  : AppConstants.events),
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 24.r,
                                                        backgroundColor: index ==
                                                                1
                                                            ? Color(customizationProvider.eventColor2)
                                                            : index == 0
                                                                ? Color(
                                                                    customizationProvider.eventColor1)
                                                                : Color(
                                                                    customizationProvider.eventColor3),
                                                      ),
                                                      Positioned(
                                                        top: 2,
                                                        bottom: 2,
                                                        left: 2,
                                                        right: 2,
                                                        child: CircleAvatar(
                                                          radius: 22.r,
                                                          backgroundColor:
                                                              Colors.white,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 4,
                                                        bottom: 4,
                                                        left: 4,
                                                        right: 4,
                                                        child: CircleAvatar(
                                                          radius: 10.r,
                                                          backgroundColor: index ==
                                                                  1
                                                              ? Color(
                                                                  customizationProvider.eventColor2)
                                                              : index == 0
                                                                  ? Color(
                                                                      customizationProvider.eventColor1)
                                                                  : Color(
                                                                      customizationProvider.eventColor3),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  CustomText(
                                                      text: AppConstants.changeColor,
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w600)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.h)
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                  )));
  }
}
