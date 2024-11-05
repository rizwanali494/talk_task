


import 'package:flutter/material.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'app_colors.dart';



ThemeData lightTheme= ThemeData(
  textTheme: TextTheme(

  ),
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
);



ThemeData darkTheme= ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
  useMaterial3: true,
);