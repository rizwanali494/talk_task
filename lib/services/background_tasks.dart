import 'dart:async';
import 'dart:io';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:talk_task/services/call_kit_service.dart';
import 'package:url_launcher/url_launcher.dart';


void simpleTaskCallback({required String task,required Map<String, dynamic>? data}) {
  simpleTask(task: task, data: data);
}


Future<void> simpleTask({required String task,required Map<String, dynamic>? data}) async {
  CallKitService.showIncomingCall(nameCaller: data?['title']??'');
  CallKitService.listenEvents()!.onData((event){
    if(event!.event==Event.actionCallAccept){
    }

  });
  LaunchApp.openApp(
    androidPackageName: 'com.example.talk_task',
    iosUrlScheme: 'talk_task://',
  );
}


Future<void> openApp() async {
  const iosUrlScheme = 'talk_task://';
  const androidUrlScheme = 'com.example.talk_task';
  if (Platform.isIOS) {
    final iosUri = Uri.parse(iosUrlScheme);
    if (await canLaunchUrl(iosUri)) {
      await launchUrl(iosUri);
    } else {
      print('Could not launch the app on iOS.');
    }
  } else if (Platform.isAndroid) {
    final androidUri = Uri.parse(androidUrlScheme);
    if (await canLaunchUrl(androidUri)) {
      await launchUrl(androidUri);
    }
  } else {
    print('Unsupported platform');
  }
}
//



//NotificationService.initialize();
//NotificationService.showNotification(title: task, description: 'hb');
//Navigator.of(initialContext!).push(MyRoute(CallScreen(date: data?['date']??"", time: data?['time']??"",)));
// navigatorKey.currentContext!.read<EventsListenerProvider>().listenEventsBox();
// navigatorKey.currentContext!.read<CallPickingProvider>().listenCallEvents(context: navigatorKey.currentContext!);
// CallKitService.showIncomingCall(nameCaller: task);