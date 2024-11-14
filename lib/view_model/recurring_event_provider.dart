import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/models/events_model.dart';
import 'package:talk_task/services/hive_service.dart';
import 'package:talk_task/utilis/app_mesages.dart';
import 'package:talk_task/utilis/date_formating.dart';
import 'package:talk_task/utilis/hive_box_names.dart';
import 'package:workmanager/workmanager.dart';
import '../view/common_widgets/custom_snackbars.dart';

class RecurringvEventsProvider extends ChangeNotifier {
  List<RecurringEventsModel> allRecurringEvents = [];

  Future<void> listenEventsBox() async {
    try {
      List<dynamic> all = await HiveHelper.getBox(boxName: HiveBoxNames.recurringEvents);
      allRecurringEvents = all.cast<RecurringEventsModel>();
      allRecurringEvents.sort((a, b) => a.title.compareTo(b.title));
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }



  Future<void> addRecurringEventHive({required String eventTitle,required String eventTime,
    required String remainderTime,required List<bool> repeatingDays,required BuildContext context}) async {
    await HiveHelper.addDataInBox(boxName: HiveBoxNames.recurringEvents, key: eventTitle, value:
    RecurringEventsModel(title: eventTitle, remainderTime: remainderTime,
        repeatingDays:  repeatingDays, eventTime: eventTime, eventScheduledDate: DateFormatting.getRecurringTime(timeString: eventTime)));
    ScaffoldMessenger.of(context).showSnackBar(SnackBars.showSnackBar(message: AppMessages.recurringEventScheduled));
    context.read<RecurringvEventsProvider>().listenEventsBox();
   
    for(int i=0;i<30;i++){
      Workmanager().registerPeriodicTask(eventTitle+i.toString(), eventTitle,frequency:Duration(days: 1),
        initialDelay:  DateFormatting.getDurationInSeconds(targetDateTime: DateFormatting.getRecurringTime(timeString: eventTime).add(const Duration(days: 1))),
        inputData: <String, dynamic>{'date':  DateFormatting.getRecurringTime(timeString: eventTime).toString().split(' ')[0],'time':eventTime,'title':eventTitle}, // Optional data for the task
        constraints: Constraints(
          networkType: NetworkType.not_required,
          requiresCharging: false,
        ),);

      // Workmanager().registerOneOffTask(
      //   eventTitle,
      //   eventTitle,
      //   initialDelay:  DateFormatting.getDurationInSeconds(targetDateTime: DateFormatting.getRecurringTime(timeString: eventTime).add(Duration(seconds: 5))),
      //   inputData: <String, dynamic>{'date':  DateFormatting.getRecurringTime(timeString: eventTime).toString().split(' ')[0],'time':eventTime,'title':eventTitle}, // Optional data for the task
      //   constraints: Constraints(
      //     networkType: NetworkType.not_required,
      //     requiresCharging: false,
      //   ),
      // );
    }

  }

}
