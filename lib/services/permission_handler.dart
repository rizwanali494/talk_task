import 'package:app_settings/app_settings.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utilis/app_constants.dart';
import '../utilis/app_images.dart';
import '../view/dialogues/permissions_dialogue.dart';

class PermissionHelper {

  static Future<bool> checkAndRequestPermissions({required BuildContext context}) async {
    bool isNotificationAllowed = await checkAndRequestNotificationPermission(context: context);
    bool isMicrophoneAllowed = await _checkAndRequestMicrophonePermission(context: context);
    return  isNotificationAllowed && isMicrophoneAllowed;
  }

  static Future<bool> checkAndRequestNotificationPermission({required BuildContext context}) async {
    var notificationStatus = await Permission.notification.status;
    if (notificationStatus.isDenied) {
     await showPermissionDialogue(permissionType: AppConstants.allowNotification, context: context, iconPath: AppImages.iconPermissionNotification);
      await AwesomeNotifications().requestPermissionToSendNotifications();
      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
      return isAllowed;
    }

    if (notificationStatus.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }

    return true;
  }

  static Future<bool> checkAndRequesLocationPermission({required BuildContext context}) async {
    var locationStatus = await Permission.locationWhenInUse.status;
    if (locationStatus.isDenied) {
      await showPermissionDialogue(permissionType: AppConstants.allowLocation, context: context, iconPath: AppImages.iconPermissionNotification);
      await AwesomeNotifications().requestPermissionToSendNotifications();
      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
      return isAllowed;
    }

    if (locationStatus.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }

    return true;
  }

  static Future<bool> _checkAndRequestMicrophonePermission({required BuildContext context}) async {
    var microphoneStatus = await Permission.microphone.status;
    print("${microphoneStatus.name} Hello g");
    if (microphoneStatus.isDenied) {
      await showPermissionDialogue(
        permissionType: AppConstants.allowMicrophone,
        context: context,
        iconPath: AppImages.iconPermissionMicrophone,
      );
      var result = await Permission.microphone.request();
      var newMicrophoneStatus = await Permission.microphone.status;
      if (!newMicrophoneStatus.isDenied) {
        return true;
      }

      if (newMicrophoneStatus.isPermanentlyDenied) {
        await AppSettings.openAppSettings();
        return false;
      }
      return false;
    }

    if (microphoneStatus.isPermanentlyDenied) {
      await AppSettings.openAppSettings();
      return false;
    }

    return true;
  }


  static Future<void> openAppSettings() async {
    await AppSettings.openAppSettings();
  }

  static Future<void> showPermissionDialogue({ required String permissionType,required BuildContext context,required String iconPath}) async {
    await showDialog(context: context, builder: (context)=>PermissionsDialogue(title:permissionType, iconPath:iconPath , callBack: (){
       Navigator.of(context).pop(true);
    }));

  }
}
