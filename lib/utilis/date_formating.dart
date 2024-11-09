


import 'package:intl/intl.dart';

class DateFormatting{

  static DateTime createDateTimeFromString({required String date, required String time}) {
    String cleanedTime = time.replaceAll(' ', '');
    String format=cleanedTime.substring(5);
    String dateTimeString = '$date ${cleanedTime.substring(0,5)} $format';
    print(dateTimeString);
    DateFormat dateFormat = DateFormat('yyyy-MM-dd hh:mm a');
    DateTime dateTime = dateFormat.parse(dateTimeString);
    return dateTime;
  }
}