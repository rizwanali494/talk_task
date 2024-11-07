import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderProvider with ChangeNotifier {
  String? selectedDate;

  selectDate(DateTime date) {
     selectedDate = DateFormat('yyyy-MM-dd').format(date);
    notifyListeners();
  }

}
