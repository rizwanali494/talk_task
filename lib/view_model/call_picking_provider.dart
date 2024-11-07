


import 'package:flutter/cupertino.dart';

class CallPickingProvider extends ChangeNotifier{
     bool callPicked=false;

     setCallStatus(bool callStatus){
       callPicked=callStatus;
       notifyListeners();
     }

     endCall(){
       callPicked=false;
       notifyListeners();
     }
}