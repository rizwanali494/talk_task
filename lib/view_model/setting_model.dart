import 'package:flutter/material.dart';
import '../utilis/app_images.dart';

class SettingModel extends ChangeNotifier {
  ///
  /// List of setting items
  ///
  List<List<String>> settingList = [
    ['About us', AppImages.iconAbout],
    ['Share App', AppImages.iconShare],
    ['Privacy Policy', AppImages.iconPrivacy],
    ['Terms & Conditions', AppImages.iconTerms],
    ['Customization', AppImages.iconCustomize],
    // ['Logout', Asset.logoutIcon]
  ];
}
