// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
//
// class HomeModel extends ChangeNotifier {
//   ///
//   /// ------- Bottom Navigation Bar
//   ///
//   int _currentIndex = 1;
//   // bool notificationOpened = true;
//   int get currentIndex => _currentIndex;
//
//   List<String> icons = [Asset.noteIcon, Asset.homeIcon, Asset.calenderIcon];
//
//   void setIndex(int index) {
//     if (_currentIndex == index) return;
//     log('Index: $index');
//     _currentIndex = index;
//     notifyListeners();
//   }
//
//   ///
//   /// -------> Calender Task Section
//   ///
//   bool _isTask = true;
//   bool get isTask => _isTask;
//
//   void setTask(bool value) {
//     _isTask = value;
//     notifyListeners();
//   }
//
//   ///
//   ///----------> set reminder Section
//   ///
//   ///
//
//   bool _isReminder = true;
//   bool get isReminder => _isReminder;
//
//   void setReminder(bool value) {
//     _isReminder = value;
//     notifyListeners();
//   }
//
//   // updateNotificationStatus() {
//   //   print("hiiiiiiii");
//   //   notificationOpened = !notificationOpened;
//   //   notifyListeners();
//   // }
//
//   // Future<void> getnotifications() async {
//   //   await FirebaseFirestore.instance
//   //       .collection("Users")
//   //       .doc(token)
//   //       .get()
//   //       .then((doc) {
//   //     notificationOpened = doc.data()!["NotificationOpenned"];
//   //   });
//   //   notifyListeners();
//   // }
//
//   String eventText = '';
//   String dateText = '';
//   String timeText = '';
//   String reminderTimeText = '';
//
//   void getEventText(String value) {
//     eventText = value;
//     notifyListeners();
//   }
//
//   void getDateText(String value) {
//     dateText = value;
//     notifyListeners();
//   }
//
//   void getTimeText(String value) {
//     timeText = value;
//     notifyListeners();
//   }
//
//   void getReminderTimeText(String value) {
//     reminderTimeText = value;
//     notifyListeners();
//   }
// }
//
// class HomeViewModelGetX extends GetxController {
//   var notificationOpened = true.obs; // Make it reactive
//
//   Future<void> updateNotificationStatusTrue() async {
//     notificationOpened.value = true;
//        await FirebaseFirestore.instance
//         .collection("Users")
//         .doc(token)
//         .update({"NotificationOpenned": true}); // Update the value
//   }
//
//   Future<void> getnotifications() async {
//     await FirebaseFirestore.instance
//         .collection("Users")
//         .doc(token)
//         .get()
//         .then((doc) {
//
//
//
//       notificationOpened.value = doc.data()?["NotificationOpenned"]??true;
//     });
//   }
//
//   Future<void> updateNotificationStatusFalse() async {
//     notificationOpened.value = false; // Update the value
//
//   }
// }




import 'package:flutter/foundation.dart';

class BottomNavBarProvider extends ChangeNotifier{
  int selectedIndex=0;


  setPageIndex({required int pageIndex}){
    selectedIndex=pageIndex;
    notifyListeners();
  }
}



