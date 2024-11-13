import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/models/events_model.dart';
import 'package:talk_task/services/hive_service.dart';
import 'package:talk_task/utilis/hive_box_names.dart';
import 'package:workmanager/workmanager.dart';

import '../utilis/app_mesages.dart';
import '../utilis/date_formating.dart';
import '../view/common_widgets/custom_snackbars.dart';

class EventsListenerProvider extends ChangeNotifier {
  List<EventsModel> allEvents = [];

  EventsListenerProvider() {
    listenEventsBox();
  }

  Future<void> listenEventsBox() async {
    try {
      List<dynamic> all = await HiveHelper.getBox(boxName: HiveBoxNames.events);
      allEvents = all.cast<EventsModel>();
      allEvents.sort((a, b) => a.eventDate.compareTo(b.eventDate));
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }




  Future<void> addEventInHive({required String eventTitle,required String eventTime,
    required String remainderTime,required DateTime eventDate,required BuildContext context}) async {
    await HiveHelper.addEventInBox(boxName: HiveBoxNames.events, key: eventTitle, value:
    EventsModel(title: eventTitle, remainderTime: remainderTime,
        eventDate:  eventDate, eventTime: eventTime));
    ScaffoldMessenger.of(context).showSnackBar(SnackBars.showSnackBar(message: AppMessages.eventScheduled));
    context.read<EventsListenerProvider>().listenEventsBox();
    Workmanager().registerOneOffTask(
     eventTitle,
      eventTitle,
      initialDelay:  DateFormatting.getDurationInSeconds(targetDateTime: eventDate),
      inputData: <String, dynamic>{'date': eventDate.toString().split(' ')[0],'time':eventTime,'title':eventTitle}, // Optional data for the task
      constraints: Constraints(
        networkType: NetworkType.not_required,
        requiresCharging: false,
      ),
    );

  }


}
