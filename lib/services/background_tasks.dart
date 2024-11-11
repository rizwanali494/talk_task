import 'dart:async';
import 'dart:io';
import 'package:app_links/app_links.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_callkit_incoming/entities/call_event.dart';
import 'package:talk_task/services/call_kit_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import '../utilis/app_routes.dart';
import '../view/screens/call_screens/call_screen.dart';


void simpleTaskCallback({required String task,required Map<String, dynamic>? data}) {
  simpleTask(task: task, data: data);
}


Future<void> simpleTask({required String task,required Map<String, dynamic>? data}) async {
  CallKitService.showIncomingCall(nameCaller: data?['title'] ?? '');
  CallKitService.listenEvents()!.onData((event) {
    if (event!.event == Event.actionCallAccept) {
      //acceptCall(context: context);
      print('accpted');
    }

    else if (event.event == Event.actionCallIncoming) {
      LaunchApp.openApp(
        androidPackageName: 'com.example.talk_task',
        iosUrlScheme: 'talktask://',
      );
      Navigator.of(initialContext!).push(MyRoute(
          CallScreen(date: data?['date'] ?? "", time: data?['time'] ?? "",)));
    }
  });

  // openApp();
  // AppLinks().uriLinkStream.listen((uri) {
  //   print(uri.data);
  //   openApp();
  // });
}


Future<void> openApp() async {
  const iosUrlScheme = 'talktask://';
  const androidUrlScheme = 'talktask://';

  try {
    if (Platform.isIOS) {
      final iosUri = Uri.parse(iosUrlScheme);
      if (await canLaunchUrl(iosUri)) {
        await launchUrl(iosUri, mode: LaunchMode.inAppWebView); // Use externalApplication for iOS
      } else {
        print('Could not launch the app on iOS.');
      }
    } else if (Platform.isAndroid) {
      final androidUri = Uri.parse(androidUrlScheme);
      if (await canLaunchUrl(androidUri)) {
        await launchUrl(androidUri, mode: LaunchMode.inAppWebView); // Use externalApplication for Android
      } else {
        print('Could not launch the app on Android.');
      }
    } else {
      print('Unsupported platform');
    }
  } catch (e) {
    print('Error opening app: $e');
  }
}




//
// LaunchApp.openApp(
// androidPackageName: 'com.example.talk_task',
// iosUrlScheme: 'talk_task://',
// );
//





//NotificationService.initialize();
//NotificationService.showNotification(title: task, description: 'hb');
//Navigator.of(initialContext!).push(MyRoute(CallScreen(date: data?['date']??"", time: data?['time']??"",)));
// navigatorKey.currentContext!.read<EventsListenerProvider>().listenEventsBox();
// navigatorKey.currentContext!.read<CallPickingProvider>().listenCallEvents(context: navigatorKey.currentContext!);
// CallKitService.showIncomingCall(nameCaller: task);