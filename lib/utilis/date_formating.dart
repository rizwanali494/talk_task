


import 'package:intl/intl.dart';

class DateFormatting{

  static DateTime createDateTimeFromString({required String date, required String time}) {
    String cleanedTime = time.replaceAll(' ', '');
    String format=cleanedTime.substring(5);
    String dateTimeString = '$date ${cleanedTime.substring(0,5)} $format';
    DateFormat dateFormat = DateFormat('yyyy-MM-dd hh:mm a');
    DateTime dateTime = dateFormat.parse(dateTimeString);
    return dateTime;
  }


  static Duration getDurationInSeconds({required DateTime targetDateTime}) {
    DateTime now = DateTime.now();
    Duration difference = targetDateTime.difference(now);
    return Duration(seconds: difference.inSeconds);
  }


  static DateTime getRecurringTime({required String timeString}) {
    String cleanedTimeString = timeString.replaceAll(RegExp(r'\s*:\s*'), ":").trim();
    if (cleanedTimeString.contains(RegExp(r'[APM]{2}'))) {
      DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat("hh:mm a");
      DateTime parsedTime = formatter.parse(cleanedTimeString);
      DateTime targetDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        parsedTime.hour,
        parsedTime.minute,
      );

      return targetDateTime;
    } else {
      throw const FormatException("Invalid time format.");
    }
  }

}