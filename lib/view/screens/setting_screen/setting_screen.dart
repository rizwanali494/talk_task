import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/view/screens/about_screen/about_screen.dart';
import 'package:talk_task/view/screens/privacy_screen/privacy_screen.dart';
import 'package:talk_task/view/screens/setting_screen/setting_model.dart';
import 'package:talk_task/view/screens/term_condition_screen/term_condition_screen.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_constants.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_text.dart';
 import 'package:share_plus/share_plus.dart';


class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String iosLink = "";
  String androidLink = "";
  @override
  void initState() {
   // init();
    super.initState();
  }
  //
  // init() async {
  //   await FirebaseFirestore.instance
  //       .collection("Constants")
  //       .doc("AppLinks")
  //       .get()
  //       .then((doc) {
  //     iosLink = doc["IOS"];
  //     androidLink = doc["Android"];
  //   });
  //   setState(() {
  //
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child:Scaffold(
           appBar: AppBars.settingsAppBar(context: context, title: AppConstants.settings),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
                child: Consumer<SettingModel>(builder: (context, model, child) {
                  return Column(
                    children: List.generate(
                        5,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 13.h),
                              child: GestureDetector(
                                onTap: () async {
                                  if (index == 0) {
                                    Navigator.push(context, MyRoute(const AboutScreen()));
                                  } else if (index == 1) {
                                    if(iosLink !="" && androidLink !=""){
                                       await Share.share(
                                        Platform.isIOS?iosLink:androidLink,
                                        subject: 'Task AI mobile app');

                                    }
                                   
                                  } else if (index == 2) {
                                    Navigator.push(context, MyRoute(const PrivacyScreen()));
                                  } else if (index == 3) {
                                    Navigator.push(context, MyRoute(const TermConditionScreen()));
                                  } else if (index == 4) {
                                    //Navigator.push(context, MyRoute(const Customi()));
                                  }

                                  // else if (index == 5) {
                                  //   _showLogoutBottomSheet(context);
                                  // }
                                },
                                child: Container(
                                  height: 65.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(color: AppColors.blueBorder),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Row(
                                      children: [
                                        Image.asset(model.settingList[index][1],
                                            width: 30.w, height: 30.h),
                                        SizedBox(width: 15.w),
                                        CustomText(
                                          text: model.settingList[index][0],
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        const Spacer(),
                                        Icon(Icons.navigate_next_sharp,
                                            size: 30.sp, color: AppColors.primary),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                  );
                }),
              ),
            )));
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 20.h),
          width: double.infinity,
          height: 340.h,
          child: Column(
            children: [
              SizedBox(
                width: 30.w,
                child: const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30.h),
              CustomText(
                text: 'Logout',
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 13.h),
              SizedBox(
                width: 350.w,
                child: const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 39.h),
              SizedBox(
                width: 240.w,
                child: CustomText(
                  text: 'Are you sure you want to logout from the app   ?',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 39.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: AppColors.greyLight,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Cancel',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          // color: lightGreyColor,
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(color: AppColors.greyLight),
                        ),
                        child: Center(
                          child: CustomText(
                            text: 'Yes, Logout',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
