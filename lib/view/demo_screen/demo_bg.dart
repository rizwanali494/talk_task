
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view_model/bottom_nav_bar_provider.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_images.dart';
import '../common_widgets/custom_text.dart';


class DemoBackgroundScreen extends StatelessWidget {
  final int type;
  const DemoBackgroundScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      ///
      /// ------>  Appbar Section
      ///
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.imgDemoNotification, width: 42.w, height: 42.h),
              CustomText(
                text: 'Reminders',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              Image.asset(AppImages.iconSettings, width: 42.w, height: 42.h)
            ],
          ),
        ),
      ),

      ///
      /// ------>  Body Section
      ///

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.blueBorder)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Add Task',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                      // SizedBox(height: 5.h),
                      Image.asset(AppImages.iconMicrophone,
                          width: 157.w, height: 157.h)

                      // SizedBox(height: 16.h),

                      ,
                      const Column(
                        children: [
                          CustomTextField(
                            labelText: 'Event:',
                          ),
                          CustomTextField(
                            labelText: 'Date:',
                          ),
                          CustomTextField(
                            labelText: 'Time:',
                          ),
                          CustomTextField(
                            labelText: 'Reminder Time:',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(AppColors.primary),
                            minimumSize: MaterialStateProperty.all<Size>(
                                Size(327.w, 50.h)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.r))),
                          ),
                          child: CustomText(
                            text: 'Add Event',
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.whiteFFFFF,
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: CustomText(
                    text: 'Upcoming Events',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(height: 5.h),
              Column(
                children: List.generate(5, (index) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 9.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: AppColors.blueBorder)),
                        child: ListTile(
                          title: Row(children: [
                            CustomText(
                              text: 'Event: ',
                              fontSize: 19.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.grey787878,
                            ),
                            CustomText(
                              text: 'Study',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.grey787878,
                            )
                          ]),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                CustomText(
                                  text: 'Date: ',
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey787878,
                                ),
                                CustomText(
                                  text: '12345',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey787878,
                                )
                              ]),
                              Row(children: [
                                CustomText(
                                  text: 'Time: ',
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey787878,
                                ),
                                CustomText(
                                  text: '6789',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey787878,
                                )
                              ]),
                              Row(children: [
                                CustomText(
                                  text: 'Reminder Time: ',
                                  fontSize: 19.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey787878,
                                ),
                                CustomText(
                                  text: '12345',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey787878,
                                )
                              ]),
                            ],
                          ),
                        ),
                      ));
                }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer<BottomNavBarProvider>(
        builder: (context, model, child) {
          return Container(
            height: 57.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.r),
                topLeft: Radius.circular(25.r),
              ),
              border: Border.all(color: AppColors.primary),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                      3,
                      (index) => SizedBox(
                        width: 100.w,
                        height: 50.h,
                        child: Center(
                          child: Image.asset(
                            AppImages.iconCalender,
                            height: 30.h,
                            width: 30.h,
                            color: AppColors.greyLight,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          );
        },
      ),
    ));
  }
}

class CustomTextField extends StatelessWidget {
  final String labelText;

  const CustomTextField({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.greyLight,
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 45.h,
          child: Stack(
            children: [
              TextField(
                style: AppTextStyles.poppins(fontSize: 16.sp, color: AppColors.greyLight,weight: FontWeight.w400),
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: const BorderSide(color: AppColors.blueBorder),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: const BorderSide(color: AppColors.blueBorder),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 10.w,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
      ],
    );
  }
}
