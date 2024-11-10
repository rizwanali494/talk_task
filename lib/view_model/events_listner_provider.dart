import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:talk_task/models/events_model.dart';
import 'package:talk_task/services/hive_service.dart';

class EventsListenerProvider extends ChangeNotifier {
  List<EventsModel> allEvents = [];

  EventsListenerProvider() {
    listenEventsBox();
  }

  Future<void> listenEventsBox() async {
    try {
      List<dynamic> all = await HiveHelper.getBox(boxName: 'events');
      allEvents = all.cast<EventsModel>();
      allEvents.sort((a, b) => a.eventDate.compareTo(b.eventDate));
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
