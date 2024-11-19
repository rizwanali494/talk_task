import 'package:app_settings/app_settings.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:talk_task/main.dart';
import 'package:talk_task/utilis/app_prefs.dart';
import '../utilis/app_constants.dart';
import '../utilis/app_images.dart';
import '../view/dialogues/permissions_dialogue.dart';

class PermissionHelper {

  static Future<bool> checkAndRequestPermissions({required BuildContext context}) async {
    bool isNotificationAllowed = await checkAndRequestNotificationPermission(context: context);
    bool isMicrophoneAllowed = await checkAndRequestMicrophonePermission(context: context);
    return  isNotificationAllowed && isMicrophoneAllowed;
  }


  static Future<bool> checkAndRequestNotificationPermission({required BuildContext context}) async {
    var notificationStatus = await Permission.notification.status;
    int permissionCount=prefs.getInt(AppPrefs.notificationClicked)??0;
    permissionCount++;
    prefs.setInt(AppPrefs.notificationClicked,permissionCount);
    if (notificationStatus.isDenied && permissionCount<=2 ) {
      var result = await Permission.notification.request();
      var newMicrophoneStatus = await Permission.notification.status;
      if (!newMicrophoneStatus.isDenied) {
        prefs.setInt(AppPrefs.notificationClicked,0);
        return true;
      }

      return false;
    }

    if (notificationStatus.isDenied && permissionCount>2) {
      bool result=await showPermissionDialogue(
        permissionType: AppConstants.allowNotification,
        context: context,
        iconPath: AppImages.iconPermissionNotification,
      );
      if(result){ await AppSettings.openAppSettings();}

      return false;
    }

    return true;
  }




  static Future<bool> checkAndRequestMicrophonePermission({required BuildContext context}) async {
    var microphoneStatus = await Permission.microphone.status;
    int permissionCount=prefs.getInt(AppPrefs.microphoneClicked)??0;
    permissionCount++;
    prefs.setInt(AppPrefs.microphoneClicked,permissionCount);
    if (microphoneStatus.isDenied && permissionCount<=2 ) {
      var result = await Permission.microphone.request();
      var newMicrophoneStatus = await Permission.microphone.status;

      if (!newMicrophoneStatus.isDenied) {
        prefs.setInt(AppPrefs.microphoneClicked,0);
        return true;
      }

      return false;
    }

    if (microphoneStatus.isDenied && permissionCount>2) {
      bool result=await showPermissionDialogue(
        permissionType: AppConstants.allowMicrophone,
        context: context,
        iconPath: AppImages.iconPermissionMicrophone,
      );
      if(result){ await AppSettings.openAppSettings();}

      return false;
    }

    return true;
  }




  static Future<bool> checkAndRequesLocationPermission({required BuildContext context}) async {
    var locationStatus = await Permission.location.status;
    int permissionCount=prefs.getInt(AppPrefs.locationClicked)??0;
    permissionCount++;
    prefs.setInt(AppPrefs.locationClicked,permissionCount);
    if (locationStatus.isDenied && permissionCount<=2 ) {
      var result = await Permission.location.request();
      var newMicrophoneStatus = await Permission.location.status;

      if (!newMicrophoneStatus.isDenied) {
        prefs.setInt(AppPrefs.locationClicked,0);
        return true;
      }

      return false;
    }

    if (locationStatus.isDenied && permissionCount>2) {
      bool result=await showPermissionDialogue(
        permissionType: AppConstants.allowLocation,
        context: context,
        iconPath: AppImages.iconPermissionNotification,
      );
      if(result){ await AppSettings.openAppSettings();}

      return false;
    }

    return true;
  }



  static Future<void> openAppSettings() async {
    await AppSettings.openAppSettings();
  }

  static Future<bool> showPermissionDialogue({ required String permissionType,required BuildContext context,required String iconPath}) async {
    bool permissionGranted=false;
    try{
      permissionGranted = await showDialog(context: context, builder: (context)=>PermissionsDialogue(title:permissionType, iconPath:iconPath , callBack: (){
        Navigator.of(context).pop(true);
      }));
    }catch(e){

    }
   return permissionGranted;

  }
}
