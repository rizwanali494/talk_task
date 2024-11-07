import 'package:flutter/cupertino.dart';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:uuid/uuid.dart';
import '../view/screens/call_screens/remainder_call.dart';
import '../view_model/call_picking_provider.dart';



class CallKitService {
  // Instance to hold the current UUID for the call
   static final String _currentUuid = const Uuid().v4();

  // Method to show incoming call notification
  static Future<void> showIncomingCall({required String nameCaller,}) async {
    CallKitParams callKitParams = CallKitParams(
      id: _currentUuid,
      nameCaller: nameCaller,
      appName: 'Callkit',
      avatar: "https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg",
      handle: '0123456789',
      type: 0,
      textAccept: 'Accept',
      textDecline: 'Decline',
      missedCallNotification: const NotificationParams(
        showNotification: true,
        isShowCallback: true,
        subtitle: 'Missed call',
        callbackText: 'Call back',
      ),
      duration: 10000,  // duration in milliseconds
      extra: <String, dynamic>{'userId': '1a2b3c4d'},
      headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
      android: const AndroidParams(
        isShowFullLockedScreen: true,

        isCustomNotification: true,
        isShowLogo: false,
        ringtonePath: 'system_ringtone_default',
        backgroundColor: '#05AAEC',
        backgroundUrl: 'https://farm2.staticflickr.com/1533/26541536141_41abe98db3_z_d.jpg',
        actionColor: '#4CAF50',
        textColor: '#ffffff',
        incomingCallNotificationChannelName: "Incoming Call",
        missedCallNotificationChannelName: "Missed Call",
        isShowCallID: false,
      ),
      ios: const IOSParams(

        iconName: 'CallKitLogo',
        handleType: 'generic',
        supportsVideo: true,
        maximumCallGroups: 2,
        maximumCallsPerCallGroup: 1,
        audioSessionMode: 'default',
        audioSessionActive: true,
        audioSessionPreferredSampleRate: 44100.0,
        audioSessionPreferredIOBufferDuration: 0.005,
        supportsDTMF: true,
        supportsHolding: true,
        supportsGrouping: false,
        supportsUngrouping: false,
        ringtonePath: 'system_ringtone_default',
      ),
    );

    // Call FlutterCallkitIncoming to display the incoming call
    await FlutterCallkitIncoming.showCallkitIncoming(callKitParams);

  }


  static Future<void> endCall() async {
    await FlutterCallkitIncoming.endCall(_currentUuid);
  }


 static Future<void> updateCallState(String callState) async {
    //await FlutterCallkitIncoming.updateCallState(_currentUuid, callState);
  }


  static Future<void> acceptCall() async {
   await FlutterCallkitIncoming.setCallConnected(_currentUuid);
  }

  static listenEvents({required BuildContext context}){
    FlutterCallkitIncoming.onEvent.listen((event) {
       print("event is ${event!.event.name}");
      if(event.event==Event.actionCallAccept){
        context.read<CallPickingProvider>().setCallStatus(true);

        Navigator.of(context).push(MyRoute(const RemainderCall(date: '04/12/2024', time: '5:30 AM',)));
      }
      else if(event.event==Event.actionCallDecline){

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
