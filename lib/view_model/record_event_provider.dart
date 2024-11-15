import 'package:flutter/cupertino.dart';
import '../services/speech_to_text_service.dart';

class RecordEventProvider extends ChangeNotifier {
  bool isRecording = false;

  RecordEventProvider() {
    listenToListeningStatus();
  }

  void listenToListeningStatus() {
    SpeechToTextService.listeningStatusStream.listen((isListening) {
      isRecording = isListening;

      notifyListeners();
    });
  }

  void initializeRecorder() {
    SpeechToTextService.initialize();
  }

  void startRecording() {
    SpeechToTextService.startListening();
  }

  void stopRecording() {
    SpeechToTextService.stopListening();
  }
}
