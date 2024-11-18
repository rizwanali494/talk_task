import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/models/events_model.dart';
import 'package:talk_task/services/hive_service.dart';
import 'package:talk_task/utilis/app_mesages.dart';
import 'package:talk_task/utilis/date_formating.dart';
import 'package:talk_task/utilis/hive_box_names.dart';
import 'package:talk_task/view_model/recurring_days_provider.dart';
import 'package:workmanager/workmanager.dart';
import '../view/common_widgets/custom_snackbars.dart';

class RecurringvEventsProvider extends ChangeNotifier {
  List<RecurringEventsModel> allRecurringEvents = [];
  String selectedTenure=HiveBoxNames.weeklyEvents;


  Future<void> listenEventsBox() async {
    try {
      await clearOldEventsFromHive();
      List<dynamic> all = await HiveHelper.getBox(boxName: selectedTenure);
      allRecurringEvents = all.cast<RecurringEventsModel>();
      allRecurringEvents.sort((a, b) => a.title.compareTo(b.title));
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }


  Future<void> addRecurringEventHive({
    required String eventTitle,
    required String eventTime,
    required String remainderTime,
    required List<bool> repeatingDays,
    required BuildContext context,
  }) async {
    await HiveHelper.addDataInBox(
      boxName: selectedTenure,
      key: eventTitle,
      value: RecurringEventsModel(
        title: eventTitle,
        remainderTime: remainderTime,
        repeatingDays: repeatingDays,
        eventTime: eventTime,
        eventScheduledDate: DateFormatting.getRecurringTime(timeString: eventTime),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBars.showSnackBar(message: AppMessages.recurringEventScheduled),
    );

    context.read<RecurringvEventsProvider>().listenEventsBox();
    List<bool> selectedDays = context.read<DaySelectionProvider>().selectedDays;
    DateTime getNextOccurrence(DateTime currentDate, int targetDayIndex) {
      int currentDayIndex = currentDate.weekday - 1;
      int daysToAdd = (targetDayIndex - currentDayIndex + 7) % 7;
      if (daysToAdd == 0) daysToAdd = 7;
      return currentDate.add(Duration(days: daysToAdd));
    }
    if (selectedTenure == HiveBoxNames.weeklyEvents) {
      DateTime currentDate = DateTime.now();
      for (int i = 0; i < 7; i++) {
        if (selectedDays[i]) {
          DateTime nextOccurrence = getNextOccurrence(currentDate, i);
          DateTime eventDateTime = DateTime(
            nextOccurrence.year,
            nextOccurrence.month,
            nextOccurrence.day,
            int.parse(eventTime.split(":")[0]),
            int.parse(eventTime.split(":")[1]),
          );

          Workmanager().registerOneOffTask(
            eventTitle,
            eventTitle,
            initialDelay: DateFormatting.getDurationInSeconds(targetDateTime: eventDateTime),
            inputData: <String, dynamic>{
              'date': eventDateTime.toString().split(' ')[0],
              'time': eventTime,
              'title': eventTitle,
            },
            constraints: Constraints(
              networkType: NetworkType.not_required,
              requiresCharging: false,
            ),
          );
        }
      }
    }

    if (selectedTenure == HiveBoxNames.monthlyEvents) {
      DateTime currentDate = DateTime.now();
      for (int i = 0; i < 30; i++) {
        if (selectedDays[i % 7]) {
          DateTime nextOccurrence = getNextOccurrence(currentDate, i % 7);
          DateTime eventDateTime = DateTime(
            nextOccurrence.year,
            nextOccurrence.month,
            nextOccurrence.day,
            int.parse(eventTime.split(":")[0]),
            int.parse(eventTime.split(":")[1]),
          );
          Workmanager().registerOneOffTask(
            eventTitle + i.toString(),  // Unique task ID
            eventTitle,                  // Task name
            initialDelay: DateFormatting.getDurationInSeconds(targetDateTime: eventDateTime),
            inputData: <String, dynamic>{
              'date': eventDateTime.toString().split(' ')[0],
              'time': eventTime,
              'title': eventTitle,
            },
            constraints: Constraints(
              networkType: NetworkType.not_required,
              requiresCharging: false,
            ),
          );
        }
      }
    }
  }




  Future<bool> clearOldEventsFromHive() async {
    Box box= await HiveHelper.getBoxObject(boxName: selectedTenure);
    List  _listValues=box.values.toList() ;
    List boxKeys=await box.keys.toList();

    for(int i=0;i<_listValues.length;i++){
      print(_listValues[i]);
      if(_listValues[i].eventScheduledDate.isBefore(DateTime.now())){
        await HiveHelper.deleteDataFromBox(boxName: selectedTenure, key: boxKeys[i]);
      }
    }
    return true;

  }



}
