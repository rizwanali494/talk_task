import 'dart:async';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:talk_task/services/permission_handler.dart';

class SpeechToTextService {
  static stt.SpeechToText _speechToText = stt.SpeechToText();
  static bool _isListening = false;
  static String _text = "";
  static final _listeningStatusController = StreamController<bool>.broadcast();
  static Stream<bool> get listeningStatusStream => _listeningStatusController.stream;

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
    _speechToText.statusListener = (status) {
    print(status);
      _listeningStatusController.add(_speechToText.isListening);
    };

    _speechToText.listen(
      onResult: (result) {
        _text = result.recognizedWords;
        print(_text);
      },
      listenFor: const Duration(minutes: 5),
      pauseFor: const Duration(seconds: 7),

      onSoundLevelChange: (level) {
        // if (level < -2 && _isListening) {
        //   stopListening();
        // }
      },
    );
    print(_speechToText.statusListener.runtimeType);
    _isListening = true;
    _listeningStatusController.add(_isListening);
  }



  static Future<void> stopListening() async {
    await _speechToText.stop();
    _isListening = false;
    _listeningStatusController.add(_isListening);
    print("Stopped listening due to silence.");
  }

  static bool isListening() {
    return _isListening;
  }

  static String getText() {
    return _text;
  }

  static void dispose() {
    _listeningStatusController.close();
  }
}
