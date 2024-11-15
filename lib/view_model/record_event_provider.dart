import 'package:flutter/cupertino.dart';
import '../services/audio_recording_service.dart';

class RecordEventProvider extends ChangeNotifier{
   bool isRecording=false;
   initializeRecorder(){
     SpeechToTextService.initialize();
   }


   startRecording(){
     isRecording=true;
     SpeechToTextService.startListening();
     notifyListeners();
   }

   stopRecording(){
     isRecording=false;
     SpeechToTextService.stopListening();
     notifyListeners();
   }


}