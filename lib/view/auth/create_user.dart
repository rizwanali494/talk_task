import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/view/demo_screen/demo_bg.dart';

import '../../utilis/app_colors.dart';
import '../../utilis/app_constants.dart';
import '../../utilis/app_images.dart';
import '../common_widgets/custom_app_bars.dart';
import '../common_widgets/custom_buttons.dart';
import '../common_widgets/custom_text.dart';
import '../common_widgets/custom_text_fields.dart';

class CreateUserName extends StatelessWidget{
  final TextEditingController _userNameController=TextEditingController();
   CreateUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteFFFFF,
      appBar: AppBars.authAppBars(
          bgColor: AppColors.whiteFFFFF, iconBrightness: Brightness.dark),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SizedBox(
              height: 1.sh*0.93,
              child: Column(children: [
                const Spacer(),
                Center(
                    child: Image.asset(
                      AppImages.iconAppLogo,
                      height: 1.sh * 0.18,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                    child: CustomText(
                      text: AppConstants.createUserName,
                      fontSize: 26.sp,
                      color: AppColors.blueDark002055,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                    child: CustomText(
                        text: AppConstants.createUniqueUserName,
                        fontSize: 19.sp,
                        color: AppColors.blueDark002055,
                        fontWeight: FontWeight.w600)),
                CustomFields.field(
                    isReadOnly: false,
                    title: '', onPressed: (){}, controller: _userNameController),
                const Spacer(),
                SizedBox(
                  height: 55.h,
                  width: double.infinity,
                  child: Buttons.customElevatedButton(title: AppConstants.continueText, backgroundColor: AppColors.blue05AAEC,
                      textColor: AppColors.whiteFFFFF, onPressed: (){},
                      isDisabled: false),
                ),
                SizedBox(height: 30.h,)
              ],),
            ),
          ),
        ],
      ),
    );
  }

}