import 'package:flutter/cupertino.dart';

class DaySelectionProvider with ChangeNotifier {
  List<bool> selectedDays = List.generate(7, (_) => false);

  void toggleDay(int index) {
    selectedDays[index] = !selectedDays[index];
    notifyListeners();
  }
}