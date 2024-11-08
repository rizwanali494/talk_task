import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerProvider with ChangeNotifier {
  String? selectedDate;

  selectDate(DateTime date) {
     selectedDate = DateFormat('yyyy-MM-dd').format(date);
    notifyListeners();
  }
  emptyProvider(){
    selectedDate=null;
    notifyListeners();
  }

}
