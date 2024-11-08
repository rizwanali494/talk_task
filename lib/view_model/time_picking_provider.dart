import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerProvider with ChangeNotifier {
  bool isTimeSelected=false;
  String? hours,minutes,timeFormat;

  selectTime({ required String hour,required String minute,required String timeAmOrPm}) {
    hours = hour;
    minutes = minute;
    timeFormat=timeAmOrPm;
    isTimeSelected=true;
    notifyListeners();
  }
  emptyTime(){
    hours=null;
    minutes=null;
    isTimeSelected=false;
    timeFormat=null;
    notifyListeners();
  }

}


class RemainderTimePickerProvider with ChangeNotifier {
  bool isTimeSelected=false;
  String? hours,minutes,timeFormat;

  selectTime({ required String hour,required String minute,required String timeAmOrPm}) {
    hours = hour;
    minutes = minute;
    timeFormat=timeAmOrPm;
    isTimeSelected=true;
    notifyListeners();
  }

  emptyTime(){
    hours=null;
    minutes=null;
    isTimeSelected=false;
    timeFormat=null;
    notifyListeners();
  }

}
