import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:talk_task/services/permission_handler.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/date_formating.dart';
import '../view/dialogues/message_dialogue.dart';
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

  static Future<bool> requestPermissions({required BuildContext context}) async {
    return PermissionHelper.checkAndRequestPermissions(context: context);
  }
  static Future<void> startListening(BuildContext context) async {
    bool hasPermission = await requestPermissions( context: context);
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
            Map result = await hitApi(text);
            try {

              if (result['event'] != 'null' ) {
                context.read<EventTitleProvider>().setTitle(result['event']);
              } else {
                print('Event title is null, skipping...');
              }
            } catch (e) {
              print('Error setting event title: ${e.toString()}');
            }

            try{
              if (result['date'] != 'null' ) {
                Map eventTime = DateFormatting.formatAudioGivenTimeToHours(result['time']);
                context.read<DatePickerProvider>().selectDate(
                        DateFormatting.formatDateToDateTime(
                            result['date'],
                            eventTime['hours'],
                            eventTime['minutes'],
                            eventTime['amPm']
                        )
                    );
              } else {
                print('Event title is null, skipping...');
              }
            }
            catch(a){}

            // Handle event time - if null, do nothing
            try {
              if (result['time'] != 'null') {
                Map eventTime = DateFormatting.formatAudioGivenTimeToHours(result['time']);
                if (eventTime.isNotEmpty && eventTime.containsKey('hours') && eventTime.containsKey('minutes') && eventTime.containsKey('amPm')) {
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
                } else {
                  print('Event time is null or invalid, skipping...');
                }
              } else {
                print('Event time is null, skipping...');
              }
            } catch (e) {
              print('Error handling event time: ${e.toString()}');
            }

            // Handle reminder time - if null, do nothing
            try {
              if (result['reminderTime'] != null) {
                Map eventRemainderTime = DateFormatting.formatAudioGivenTimeToHours(result['reminderTime']);
                if (eventRemainderTime.isNotEmpty && eventRemainderTime.containsKey('hours') && eventRemainderTime.containsKey('minutes') && eventRemainderTime.containsKey('amPm')) {
                  context.read<RemainderTimePickerProvider>().selectTime(
                      hour: eventRemainderTime['hours'],
                      minute: eventRemainderTime['minutes'],
                      timeAmOrPm: eventRemainderTime['amPm']
                  );
                } else {
                  print('Reminder time is null or invalid, skipping...');
                }
              } else {
                print('Reminder time is null, skipping...');
              }
            } catch (e) {
              print('Error handling reminder time: ${e.toString()}');
            }

          } catch (e) {
            print('Error fetching or processing data: ${e.toString()}');
          }

          // try {
          //
          //   Map result = await hitApi(text);
          //   Map eventTime = DateFormatting.formatAudioGivenTimeToHours(result['time']);
          //   Map eventRemainderTime = DateFormatting.formatAudioGivenTimeToHours(result['reminderTime']);
          //   context.read<EventTitleProvider>().setTitle(result['event']);
          //   context.read<DatePickerProvider>().selectDate(
          //       DateFormatting.formatDateToDateTime(
          //           result['date'],
          //           eventTime['hours'],
          //           eventTime['minutes'],
          //           eventTime['amPm']
          //       )
          //   );
          //
          //   context.read<TimePickerProvider>().selectTime(
          //       hour: eventTime['hours'],
          //       minute: eventTime['minutes'],
          //       timeAmOrPm: eventTime['amPm']
          //   );
          //
          //   context.read<RemainderTimePickerProvider>().selectTime(
          //       hour: eventRemainderTime['hours'],
          //       minute: eventRemainderTime['minutes'],
          //       timeAmOrPm: eventRemainderTime['amPm']
          //   );
          // } catch (e) {
          //   // showDialog(context: context, builder: (context)=>const MessageDialogue(title: AppConstants.messageMicrophone,));
          //   print(e.toString());
          // }
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
