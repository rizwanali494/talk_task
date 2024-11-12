
import 'package:flutter/foundation.dart';

class BottomNavBarProvider extends ChangeNotifier{
  int selectedIndex=0;


  setPageIndex({required int pageIndex}){
    selectedIndex=pageIndex;
    notifyListeners();
  }
}



