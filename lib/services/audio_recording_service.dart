import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:talk_task/services/permission_handler.dart';

class SpeechToTextService {
  static stt.SpeechToText _speechToText = stt.SpeechToText();
  static bool _isListening = false;
  static String _text = "";


  static Future<bool> initialize() async {
    bool available = await _speechToText.initialize();
    return available;
  }


  static Future<bool> requestPermissions() async {
    return PermissionHelper.checkAndRequestPermissions();

  }


  static Future<void> startListening() async {
    bool hasPermission = await requestPermissions();
    if (!hasPermission) {
      return;
    }

    _speechToText.listen(
      onResult: (result) {
        _text = result.recognizedWords;
      },
    );
    _isListening = true;
  }


  static Future<void> stopListening() async {
    await _speechToText.stop();
    _isListening = false;
  }


  static bool isListening() {
    return _isListening;
  }


  static String getText() {
    return _text;
  }
}
