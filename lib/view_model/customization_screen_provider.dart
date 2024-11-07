// ignore: file_names
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomizationProvider with ChangeNotifier {
  dynamic eventColor1;
  dynamic eventColor2;
  dynamic eventColor3;
  bool isLoading = false;

  changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> fetchColors() async {
    changeLoadingState();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    eventColor1 = prefs.getInt('1 event') ?? 4278255360;
    eventColor2 = prefs.getInt('2 event') ?? 4294967040;
    eventColor3 = prefs.getInt('3 event') ?? 4294901760;
    changeLoadingState();
    notifyListeners();
  }

  setColours(String eventCount, Color selectedColor) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (eventCount == "1") {
      await prefs.setInt('1 event', selectedColor.value);
      eventColor1 = selectedColor.value;
    }
    if (eventCount == "2") {
      await prefs.setInt('2 event', selectedColor.value);
      eventColor2 = selectedColor.value;
    }
    if (eventCount == "3") {
      await prefs.setInt('3 event', selectedColor.value);
      eventColor3 = selectedColor.value;
    }
    notifyListeners();
  }
}
