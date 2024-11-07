
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:talk_task/services/call_kit_service.dart';
import '../utilis/app_routes.dart';
import '../view/screens/call_screens/remainder_call.dart';


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

     acceptCall({required BuildContext context}){
       setCallStatus(true);
       Navigator.of(context).push(MyRoute(const RemainderCall(date: '04/12/2024', time: '5:30 AM',)));

     }

     startCall({required String callerName}){
       CallKitService.showIncomingCall(nameCaller: callerName);
     }


     listenCallEvents({required BuildContext context}){
      CallKitService.listenEvents()!.onData((event){
        if(event!.event==Event.actionCallAccept){
          acceptCall(context: context);
        }
        else if(event.event==Event.actionCallDecline){
          endCall();
          Navigator.of(context).pop();
        }
        else if(event.event==Event.actionCallCustom){
          print('gwvf');

        }
        else if(event.event==Event.actionCallIncoming){
          Navigator.of(context).push(MyRoute(const RemainderCall(date: '04/12/2024', time: '5:30 AM',)));
        }
       });

     }
}