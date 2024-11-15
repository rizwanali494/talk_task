





import 'package:flutter/foundation.dart';

class EventTitleProvider extends ChangeNotifier{
  String title='';
  setTitle(a){
    title=a;
    notifyListeners();
  }
}