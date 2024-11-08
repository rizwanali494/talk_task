


import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/view_model/time_picking_provider.dart';
import 'date_picker_provider.dart';

class ResetProviders{
  static void resetHomeProviders({required BuildContext context}){
    context.read<RemainderTimePickerProvider>().emptyTime();
    context.read<TimePickerProvider>().emptyTime();
    context.read<DatePickerProvider>().emptyProvider();
  }
}