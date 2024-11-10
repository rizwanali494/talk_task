import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/main.dart';
import 'package:talk_task/services/call_kit_service.dart';
import 'package:talk_task/services/hive_service.dart';
import 'package:talk_task/services/local_notification_service.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/utilis/hive_box_names.dart';
import 'package:talk_task/view/screens/call_screens/call_screen.dart';
import 'package:talk_task/view_model/call_picking_provider.dart';
import 'package:talk_task/view_model/events_listner_provider.dart';


void simpleTaskCallback({required String task,required Map<String, dynamic>? data}) {
  simpleTask(task: task, data: data);
}

Future<void> simpleTask({required String task,required Map<String, dynamic>? data}) async {

  //NotificationService.initialize();
  CallKitService.showIncomingCall(nameCaller: task);
  //NotificationService.showNotification(title: task, description: 'hb');
  Navigator.of(navigatorKey.currentContext!).push(MyRoute(CallScreen(date: data?['date']??"", time: data?['time']??"",)));
 // navigatorKey.currentContext!.read<EventsListenerProvider>().listenEventsBox();
 // navigatorKey.currentContext!.read<CallPickingProvider>().listenCallEvents(context: navigatorKey.currentContext!);
 // CallKitService.showIncomingCall(nameCaller: task);

}



