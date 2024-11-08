


import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../utilis/app_colors.dart';

//https://farm4.staticflickr.com/3075/3168662394_7d7103de7d_z_d.jpg
//https://farm2.staticflickr.com/1533/26541536141_41abe98db3_z_d.jpg

class NotificationService {
  static int _notificationId = 0;

  static void initialize() {
    AwesomeNotifications().initialize(
      'resource://mipmap/ic_launcher',
      [
        NotificationChannel(
          channelKey: 'jawad',
          defaultRingtoneType: DefaultRingtoneType.Notification,
          enableVibration: true,
          importance: NotificationImportance.High,
          channelDescription:
          'my simple channeol',
          defaultColor: Colors.pink,
          ledColor: Colors.pink,
          channelName:'jawad',
        ),
      ],
    );
  }


  static void showNotification({required String title,required String description}) async {

    bool result=await checkAndRequestNotificationPermission();
    if(!result){return;}
    _notificationId++;
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: _notificationId,
        channelKey: 'jawad',
        title: title,
        body: description,
        chronometer: const Duration(seconds: 0),
        color:AppColors.primary ,
       // backgroundColor: Colors.pink,
       // largeIcon: 'resource://drawable/lion',
      //  bigPicture: 'https://farm2.staticflickr.com/1533/26541536141_41abe98db3_z_d.jpg'
       // , notificationLayout: NotificationLayout.BigPicture,
      ),

      actionButtons: [NotificationActionButton(key: '1',label: 'Dismiss',isDangerousOption: true)],
      schedule: NotificationInterval(interval: const Duration(seconds: 120),repeats: true)
    );
    // scheduleDismissal(_notificationId);
    listenNotificationActions();
  }


  static Future<bool> checkAndRequestNotificationPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
      isAllowed = await AwesomeNotifications().isNotificationAllowed();
    }
    return isAllowed;
  }


  static void scheduleDismissal(int notificationId) {
    Future.delayed(const Duration(seconds: 5), () async {
      await AwesomeNotifications().dismiss(notificationId);
    });
  }


  static listenNotificationActions(){
    AwesomeNotifications().setListeners(
        onActionReceivedMethod:         NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:    NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  NotificationController.onDismissActionReceivedMethod
    );
  }
}






class NotificationController {

  @pragma("vm:entry-point")
  static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    print(receivedNotification.title.toString()+' has arrived');
  }

  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    print(receivedNotification.actionType);
  }

  @pragma("vm:entry-point")
  static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    print(receivedAction.title.toString()+' dismissed');
  }

  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    print(receivedAction.title.toString()+' recieved');
  }

}