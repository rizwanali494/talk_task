import 'package:flutter/cupertino.dart';
import '../services/openAi.dart';
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

  void startRecording(BuildContext context) {
    SpeechToTextService.startListening(context);
  }

  void stopRecording() {
    SpeechToTextService.stopListening();
  }

  // void updateAllFields() {
  //   SpeechToTextService.speechToText.listen(
  //     onResult: (a) async {
  //      if(a.finalResult){
  //        print(a.recognizedWords);
  //        Map response=await extractFieldsUsingGPT(a.recognizedWords);
  //        print(response);
  //      }
  //     },
  //     listenFor: const Duration(minutes: 5),
  //     pauseFor: const Duration(seconds: 7),
  //     onSoundLevelChange: (level) {
  //       // if (level < -2 && _isListening) {
  //       //   stopListening();
  //       // }
  //     },
  //   );
  // }
}

