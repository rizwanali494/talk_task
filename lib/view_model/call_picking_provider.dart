


import 'package:flutter/cupertino.dart';
import 'package:talk_task/services/call_kit_service.dart';


class CallPickingProvider extends ChangeNotifier{
     bool callPicked=false;

     setCallStatus(bool callStatus){
       callPicked=callStatus;
       notifyListeners();
     }



     endCall(){
       CallKitService.endCall();
       callPicked=false;
       notifyListeners();
     }
}