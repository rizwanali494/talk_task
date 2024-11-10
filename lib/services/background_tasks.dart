import 'package:talk_task/services/call_kit_service.dart';
import 'package:talk_task/services/local_notification_service.dart';


void simpleTaskCallback() {
  simpleTask();
}

void simpleTask() {
  NotificationService.initialize();
  CallKitService.showIncomingCall(nameCaller: 'jawad');
  NotificationService.showNotification(title: 'hjvhj', description: 'hb');
}



