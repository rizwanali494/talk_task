import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:talk_task/main.dart';
import 'package:talk_task/services/permission_handler.dart';
import 'package:talk_task/utilis/date_formating.dart';

import '../view_model/date_picker_provider.dart';
import '../view_model/event_title_provider.dart';
import '../view_model/time_picking_provider.dart';
import 'openAi.dart';

class SpeechToTextService {
  static stt.SpeechToText speechToText = stt.SpeechToText();
  static bool _isListening = false;
  static String text = "";
  static final _listeningStatusController = StreamController<bool>.broadcast();
  static Stream<bool> get listeningStatusStream => _listeningStatusController.stream;

  static Future<bool> initialize() async {
    bool available = await speechToText.initialize();
    return available;
  }

  static Future<bool> requestPermissions() async {
    return PermissionHelper.checkAndRequestPermissions();
  }
  static Future<void> startListening(BuildContext context) async {
    bool hasPermission = await requestPermissions();
    if (!hasPermission) {
      return;
    }

    // Set the status listener to capture the listening state
    speechToText.statusListener = (status) {
      print(status);
      _listeningStatusController.add(speechToText.isListening);
    };

    // Start listening with the specified settings
    speechToText.listen(
      onResult: (result) async {
        text = result.recognizedWords;

        if (result.finalResult) {
          try {
            // Hit the API and process the response
            Map result = await hitApi(text);

            // Format the event time and remainder time
            Map eventTime = DateFormatting.formatAudioGivenTimeToHours(result['time']);
            Map eventRemainderTime = DateFormatting.formatAudioGivenTimeToHours(result['reminderTime']);

            // Update the context providers with event details
            context.read<EventTitleProvider>().setTitle(result['event']);
            context.read<DatePickerProvider>().selectDate(
                DateFormatting.formatDateToDateTime(
                    result['date'],
                    eventTime['hours'],
                    eventTime['minutes'],
                    eventTime['amPm']
                )
            );

            context.read<TimePickerProvider>().selectTime(
                hour: eventTime['hours'],
                minute: eventTime['minutes'],
                timeAmOrPm: eventTime['amPm']
            );

            context.read<RemainderTimePickerProvider>().selectTime(
                hour: eventRemainderTime['hours'],
                minute: eventRemainderTime['minutes'],
                timeAmOrPm: eventRemainderTime['amPm']
            );
          } catch (e) {
            print(e.toString());
          }
        }
      },
      listenFor: const Duration(minutes: 5),
      pauseFor: const Duration(seconds: 7),

      onSoundLevelChange: (level) {
        // You can add any logic here if needed
      },
    );

    // Set the listening status to true
    _isListening = true;
    _listeningStatusController.add(_isListening);
  }




  static Future<void> stopListening() async {
    await speechToText.stop();
    _isListening = false;
    _listeningStatusController.add(_isListening);

  }

  static bool isListening() {
    return _isListening;
  }

  static String getText() {
    return text;
  }

  static Future<Map> hitApi(String input) async {
    Map response=await extractFieldsUsingGPT(input);
    print(response);
   return response;
  }

  static void dispose() {
    _listeningStatusController.close();
  }


}
