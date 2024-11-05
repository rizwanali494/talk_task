


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBars{
  static AppBar authAppBars({required Color bgColor,required Brightness iconBrightness}){
    return AppBar(
      elevation: 0,
      backgroundColor: bgColor,
      toolbarHeight: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: iconBrightness
      ),
    );
  }

}