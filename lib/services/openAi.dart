
// import 'dart:convert';
// import 'package:http/http.dart' as http;



// Future<Map<String, String?>> extractFieldsUsingGPT(String input) async {
//   final apiKey = 'sk-OUdXCj-i-r45z9W9mgtRmCh1oKWSFJbEEZsZ-Iiw3dT3BlbkFJSyipG0Zu1CNUGuyP3d8oUsliy19vqvetGAVROdX0kA'; // Replace with your OpenAI API key
//   final url = Uri.parse('https://api.openai.com/v1/chat/completions');
//     final currentYear = DateTime.now().year;

//   // Create the prompt to send to GPT
//   final prompt = '''
// Extract the following fields from the input text:
// 1. Event: A description of the event.
// 2. Date: The date of the event (in YYYY-MM-DD format). If only the month and day are provided, assume the current year ($currentYear).
// 3. Time: The time of the event (in h:mm a format, e.g., 5:05 PM).
// 4. Reminder Time: The time to send the reminder (in h:mm a format, e.g., 3:05 PM). calculate it accordingly.
// If a field is missing, return null for that field.

// Input: "$input"

// Output:
// ''';

//   // Prepare the request body
//   final body = json.encode({
//     "model": "gpt-3.5-turbo", // or "gpt-4" if you have access to it
//     "messages": [
//       {"role": "user", "content": prompt}
//     ],
//     "max_tokens": 100,
//   });

//   // Send the request
//   final response = await http.post(
//     url,
//     headers: {
//       'Content-Type': 'application/json',
//       'Authorization': 'Bearer $apiKey',
//     },
//     body: body,
//   );

//   // Handle the response
//   if (response.statusCode == 200) {
//     final Map<String, dynamic> responseData = json.decode(response.body);
//     final content = responseData['choices'][0]['message']['content'];

//     // Extract the fields from the content response
//     Map<String, String?> extractedFields = {
//       'event': _extractField(content, 'Event'),
//       'date': _extractField(content, 'Date'),
//       'time': _extractField(content, 'Time'),
//       'reminderTime': _extractField(content, 'Reminder Time'),
//     };

//     return extractedFields;
//   } else {
//     print('Failed to call OpenAI API: ${response.statusCode}');
//     return {
//       'event': null,
//       'date': null,
//       'time': null,
//       'reminderTime': null,
//     };
//   }
// }

// // Helper function to extract fields from the GPT response
// String? _extractField(String response, String fieldName) {
//   final fieldPattern = RegExp('$fieldName: (.*)', caseSensitive: false);
//   final match = fieldPattern.firstMatch(response);
//   if (match != null) {
//     return match.group(1)?.trim();
//   }
//   return null;
// }



import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart'; // Import for formatting date and time

Future<Map<String, String?>> extractFieldsUsingGPT(String input) async {
  final apiKey = 'sk-OUdXCj-i-r45z9W9mgtRmCh1oKWSFJbEEZsZ-Iiw3dT3BlbkFJSyipG0Zu1CNUGuyP3d8oUsliy19vqvetGAVROdX0kA'; // Replace with your OpenAI API key
  final url = Uri.parse('https://api.openai.com/v1/chat/completions');
  final currentYear = DateTime.now().year;
   String now = DateTime.now().toString();
  // Create the prompt to send to GPT
  final prompt = '''
Extract the following fields from the input text:
1. Event: A description of the event.
2. Date: The date of the event (in YYYY-MM-DD format). If phrases like "today," "tomorrow," "next week," or "next month" are used, calculate according  to current date  which is  $now and convert them to the actual date.
3. Time: The time of the event (in h:mm a format, e.g., 5:05 PM). If the time is described relative to the current time (e.g., "5 minutes from now"), calculate the correct time.
4. Reminder Time: The time to send the reminder (in h:mm a format, e.g., 3:05 PM). Calculate it based on the time of the event and any time offset given (e.g., "30 minutes before").
If a field is missing, return null for that field. The fields may appear in any order in the input. Always give hours in two digits like if its 5 give 05

Input: "$input"

Output:
''';

  // Prepare the request body
  final body = json.encode({
    "model": "gpt-3.5-turbo", // or "gpt-4" if you have access to it
    "messages": [
      {"role": "user", "content": prompt}
    ],
    "max_tokens": 150,
  });

  // Send the request
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    },
    body: body,
  );

  // Handle the response
  if (response.statusCode == 200) {
    final Map<String, dynamic> responseData = json.decode(response.body);
    final content = responseData['choices'][0]['message']['content'];

    // Extract the fields from the content response
    Map<String, String?> extractedFields = {
      'event': _extractField(content, 'Event'),
      'date': _extractField(content, 'Date'),
      'time': _extractField(content, 'Time'),
      'reminderTime': _extractField(content, 'Reminder Time'),
    };

    // Handle relative dates like "today," "tomorrow," "next week"
    extractedFields['date'] = _handleRelativeDate(extractedFields['date']);
    // Handle relative times like "5 minutes from now"
    extractedFields['time'] = _handleRelativeTime(extractedFields['time']);
    
    return extractedFields;
  } else {
    print('Failed to call OpenAI API: ${response.statusCode}');
    return {
      'event': null,
      'date': null,
      'time': null,
      'reminderTime': null,
    };
  }
}

// Helper function to extract fields from the GPT response
String? _extractField(String response, String fieldName) {
  final fieldPattern = RegExp('$fieldName: (.*)', caseSensitive: false);
  final match = fieldPattern.firstMatch(response);
  if (match != null) {
    return match.group(1)?.trim();
  }
  return null;
}

// Function to handle relative date inputs
String? _handleRelativeDate(String? date) {
  if (date == null) return null;
  final now = DateTime.now();

  switch (date.toLowerCase()) {
    case 'today':
      return DateFormat('yyyy-MM-dd').format(now);
    case 'tomorrow':
      return DateFormat('yyyy-MM-dd').format(now.add(Duration(days: 1)));
    case 'next week':
      return DateFormat('yyyy-MM-dd').format(now.add(Duration(days: 7)));
    case 'next month':
      return DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month + 1, now.day));
    default:
      return date; // Assume it's already in YYYY-MM-DD format if not a relative date
  }
}

// Function to handle relative time inputs
String? _handleRelativeTime(String? time) {
  if (time == null) return null;

  final now = DateTime.now();
  final timePattern = RegExp(r'(\d+) minutes? from now', caseSensitive: false);
  final match = timePattern.firstMatch(time);

  if (match != null) {
    final minutesFromNow = int.parse(match.group(1)!);
    final newTime = now.add(Duration(minutes: minutesFromNow));
    return DateFormat('h:mm a').format(newTime);
  }

  return time; // Assume it's already in h:mm a format if not a relative time
}
