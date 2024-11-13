import 'package:app_settings/app_settings.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {

  static Future<bool> checkAndRequestPermissions() async {
    bool isNotificationAllowed = await _checkAndRequestNotificationPermission();
    bool isMicrophoneAllowed = await _checkAndRequestMicrophonePermission();
    return isNotificationAllowed && isMicrophoneAllowed;
  }

  static Future<bool> _checkAndRequestNotificationPermission() async {
    var notificationStatus = await Permission.notification.status;
    if (notificationStatus.isDenied) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        _showSettingsPrompt('notification');
        return false;
      }
      return isAllowed;
    }

    if (notificationStatus.isPermanentlyDenied) {
      _showSettingsPrompt('notification');
      return false;
    }

    return true;
  }



  static Future<bool> _checkAndRequestMicrophonePermission() async {
    var microphoneStatus = await Permission.microphone.status;
    if (microphoneStatus.isDenied) {
      var result = await Permission.microphone.request();
      if (!result.isGranted) {
        _showSettingsPrompt('microphone');
        return false;
      }
      return result.isGranted;
    }

    if (microphoneStatus.isPermanentlyDenied) {
      _showSettingsPrompt('microphone');
      return false;
    }

    return true;
  }



  static void _showSettingsPrompt(String permissionType) async {
    EasyLoading.showInfo('Please enable $permissionType permission in settings.');
    await Future.delayed(const Duration(seconds: 3));
    await AppSettings.openAppSettings();
  }
}
