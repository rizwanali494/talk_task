import 'dart:async';
import 'package:flutter_callkit_incoming/entities/android_params.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/ios_params.dart';
import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:uuid/uuid.dart';



class CallKitService {
  // Instance to hold the current UUID for the call
   static final String _currentUuid = const Uuid().v4();
   static final StreamController<CallEvent?> _callEventController = StreamController<CallEvent?>.broadcast();
   static StreamSubscription<CallEvent?>? _subscription;

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
        isShowCallback: false,
        subtitle: 'Missed call',
        callbackText: 'Call back',
      ),
      duration: 30000,  // duration in milliseconds
      extra: <String, dynamic>{'userId': '1a2b3c4d'},
      headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
      android: const AndroidParams(
        isShowFullLockedScreen: true,
        isCustomNotification: true,
        isShowLogo: true,
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


 static Future<void> endAllCalls() async {
    await FlutterCallkitIncoming.endAllCalls();
  }

   static Future<void> acceptCall() async {
    // await FlutterCallkitIncoming.hideCallkitIncoming(params);
   }

  static StreamSubscription<CallEvent?>? listenEvents(){
    _subscription = FlutterCallkitIncoming.onEvent.listen((event) {});
    return _subscription;
  }
}
