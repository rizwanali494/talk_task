


import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/view_model/event_title_provider.dart';
import 'package:talk_task/view_model/recurring_days_provider.dart';
import 'package:talk_task/view_model/time_picking_provider.dart';
import 'date_picker_provider.dart';

class ResetProviders{
  static void resetHomeProviders({required BuildContext context}){
    context.read<RemainderTimePickerProvider>().emptyTime();
    context.read<TimePickerProvider>().emptyTime();
    context.read<DatePickerProvider>().emptyProvider();
    context.read<EventTitleProvider>().setTitle('');
    context.read<DaySelectionProvider>().selectedDays=List.generate(7, (a)=>false);
  }
}