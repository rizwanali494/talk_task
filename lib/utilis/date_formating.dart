


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


  static Map formatAudioGivenTimeToHours(String time){
      final RegExp timeRegex = RegExp(r'(\d{1,2}):(\d{2})\s([APM]{2})');
      final match = timeRegex.firstMatch(time);
     try{
       if (match != null) {
         // Extracting hours, minutes, and AM/PM from the match
         String hours = match.group(1)!;  // First group is the hours
         String minutes = match.group(2)!;  // Second group is the minutes
         String amPm = match.group(3)!;  // Third group is AM/PM

         return {
           'hours': hours,
           'minutes': minutes,
           'amPm': amPm,
         };
       } else {
         throw FormatException('Invalid time format. Expected format: "h:mm AM/PM"');
       }
     }
     catch(e){
       return {};
       print(e.toString());
     }

  }




  static DateTime formatDateToDateTime(String date, String hours, String minutes, String amPm) {
    String timeString = '$date $hours:$minutes $amPm';
    DateFormat dateFormat = DateFormat('yyyy-MM-dd hh:mm a');
    DateTime dateTime = dateFormat.parse(timeString);
    return dateTime;
  }


  DateTime formatCustomDateTimeToString(String date, String hours, String minutes, String amPm) {
    try {
      // Step 1: Parse the custom date format 'YYYY-DD-MM' to a DateTime object.
      List<String> parts = date.split('-');
      if (parts.length != 3) {
        throw FormatException('Invalid date format. Expected format: YYYY-DD-MM');
      }

      int year = int.parse(parts[0]);  // Year
      int day = int.parse(parts[1]);   // Day
      int month = int.parse(parts[2]); // Month
      int hour = int.parse(hours);     // Hour in 12-hour format
      int minute = int.parse(minutes); // Minutes

      // Step 2: Convert the 12-hour format to 24-hour format based on AM/PM
      if (amPm == 'PM' && hour != 12) {
        hour += 12; // Convert PM to 24-hour format
      } else if (amPm == 'AM' && hour == 12) {
        hour = 0; // Handle midnight (12 AM -> 00)
      }

      // Step 3: Create the DateTime object using the parsed date and adjusted time
      DateTime dateTime = DateTime(year, month, day, hour, minute);

      // Step 4: Return the DateTime object
      return dateTime;
    } catch (e) {
      // Catch any errors and rethrow with a custom message or handle accordingly
      throw FormatException('Error: ${e.toString()}');
    }
  }



}