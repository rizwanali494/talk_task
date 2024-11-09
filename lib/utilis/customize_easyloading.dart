


import 'dart:ui';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_text_styles.dart';

import 'app_colors.dart';

class CustomizeEasyLoading{
  static void customizeEasyLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 35.0
      ..lineWidth = 49.0
      ..textStyle = AppTextStyles.poppins(height: 1.5, color: AppColors.whiteFFFFF, fontSize: 12.sp, weight: FontWeight.w400)
      ..radius = 10.0
      ..progressColor = AppColors.whiteFFFFF
      ..backgroundColor = AppColors.primary
      ..indicatorColor = AppColors.whiteFFFFF
      ..textColor = AppColors.whiteFFFFF
      ..maskColor = AppColors.whiteFFFFF.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = true;
  }
}