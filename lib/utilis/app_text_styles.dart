import 'package:flutter/material.dart';


class AppTextStyles{

  static poppins({required Color color,required fontSize,required FontWeight weight,height=1.0,shouldUnderline=false}){
return TextStyle(height:height,color: color,fontWeight: weight,fontSize: fontSize,fontFamily:AppFontFamilies.poppins,decoration:shouldUnderline? TextDecoration.underline:TextDecoration.none );
}

  static righteous({required Color color,required fontSize,required FontWeight weight,}){
    return TextStyle(height: 1,color: color,fontWeight: weight,fontSize: fontSize,fontFamily:AppFontFamilies.righteous );
  }
}



class AppFontFamilies{
  static String poppins='Poppins';
  static String righteous='Righteous';
}