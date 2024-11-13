
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/main.dart';
import 'package:talk_task/models/events_model.dart';
import 'package:talk_task/services/hive_service.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/utilis/hive_box_names.dart';
import 'package:talk_task/view/common_widgets/custom_cards.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import 'package:workmanager/workmanager.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../../utilis/date_formating.dart';
import '../../../view_model/date_picker_provider.dart';
import '../../../view_model/events_listner_provider.dart';
import '../../../view_model/provider_list.dart';
import '../../../view_model/time_picking_provider.dart';
import '../../common_widgets/custom_buttons.dart';
import '../../common_widgets/custom_snackbars.dart';
import '../../common_widgets/custom_text_fields.dart';
import '../dialogues/pick_date_dialogue.dart';
import '../dialogues/pick_time_dialogue.dart';
import '../notification_screen/notification_screen.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _eventController= TextEditingController();
  final TextEditingController _dateController= TextEditingController();
  final TextEditingController _timeController= TextEditingController();
  final TextEditingController _remainderTimeController= TextEditingController();



  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((a){
     ResetProviders.resetHomeProviders(context: context);
     context.read<EventsListenerProvider>().listenEventsBox();
   });


  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteFFFFF,
      appBar:_topBar() ,
    body:_body() ,
    );
  }



  //top appbar
  AppBar _topBar(){
    return AppBar(
      backgroundColor: AppColors.whiteFFFFF,
      surfaceTintColor: AppColors.whiteFFFFF,
      flexibleSpace: Padding(
        padding:  EdgeInsets.only(top: 8.h),
        child: Row(
          children: [
            SizedBox(width: 20.w,),
            Text(AppConstants.taskAi,style: AppTextStyles.poppins(color: AppColors.blueDark002055, fontSize: 20.sp, weight: FontWeight.w700),),
            const Spacer(),
            Buttons.customIconButton(onPressed: (){
              Navigator.push(context, MyRoute(const NotificationScreen()));
            }, icon: AppImages.iconNotifications),
            SizedBox(width: 20.w,),
          ],),
      ),

    );
  }



  //body

Widget _body(){
 return SingleChildScrollView(
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
     _cardAddEvent(),
     Padding(
       padding:  EdgeInsets.only(left: 16.w),
       child: CustomText(text: AppConstants.upcomingEvents,fontWeight: FontWeight.w700,fontSize: 20.sp,color: AppColors.blueDark002055,),
       
     ),
      SizedBox(height: 5.h,),
       _displayEvents()
   ],),
 );
}


Widget _cardAddEvent(){
  return Container(
    height: 1.sh*0.63,
    margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.whiteFFFFF,
        boxShadow: const [BoxShadow(color: AppColors.blueBorder,spreadRadius: 0.4,blurRadius: 1.0)]
    ),
    child: SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 13.w),
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h,),
            Center(child: Text(AppConstants.addTask,style: AppTextStyles.poppins(color: AppColors.blueDark002055, fontSize: 20.sp, weight: FontWeight.w700),))
            , Image.asset(AppImages.iconMicrophone,height: 200.h,color: AppColors.secondary,)
            ,  CustomFields.field(title: AppConstants.event, onPressed: (){}, controller: _eventController,isReadOnly: false)
            ,  Consumer<DatePickerProvider>(
              builder: (BuildContext context,  value, Widget? child) {
                if(value.selectedDate!=null){_dateController.text=value.selectedDate??"";}
                return  CustomFields.field(title: AppConstants.date, onPressed: (){
                  showDialog(
                    context: context, builder: (BuildContext context) =>   PickDateDialogue(),
                  );
              },  controller: _dateController);}
            )
            ,  Consumer<TimePickerProvider>(
              builder: (BuildContext context,  value, Widget? child) {
                if(value.isTimeSelected){
                  _timeController.text="${value.hours} : ${value.minutes} ${value.timeFormat}";
                }
                return CustomFields.field(title: AppConstants.time, onPressed: (){
                  showDialog(context: context, builder: (context)=> const PickTimeDialogue(isRemainderTimePicker: false,));
                }, controller: _timeController);
              },

            )

            ,  Consumer<RemainderTimePickerProvider>(
              builder: (BuildContext context,  value, Widget? child) {
                if(value.isTimeSelected){
                  _remainderTimeController.text="${value.hours} : ${value.minutes} ${value.timeFormat}";
                }
                return CustomFields.field(title: AppConstants.reminderTime, onPressed: (){
                  showDialog(context: context, builder: (context)=> const PickTimeDialogue(isRemainderTimePicker: true,));
                }, controller: _remainderTimeController);
              },

            ),


            SizedBox(height: 8.h,)
            ,SizedBox(
                width: 1.sw*0.9,
                child: Buttons.customElevatedButton(title: AppConstants.addEvent, backgroundColor: AppColors.greyDark6C6D6D.withOpacity(0.5), textColor: AppColors.whiteFFFFF, onPressed: () async {
                          if(_eventController.text.replaceAll(' ', '').isEmpty){
                            EasyLoading.showInfo('Event name required');
                            return;
                          }
                          if(_dateController.text.isEmpty){
                            EasyLoading.showInfo('Event date required');
                            return;
                          }
                          if(_timeController.text.isEmpty){
                            EasyLoading.showInfo('Event time required');
                            return;
                          }
                          if(_remainderTimeController.text.isEmpty){
                            EasyLoading.showInfo('Event remainder time required');
                            return;
                          }

                          _addEventHive(eventTitle: _eventController.text, eventTime: _timeController.text,
                              remainderTime: _remainderTimeController.text, eventDate:DateFormatting.createDateTimeFromString(date: _dateController.text, time: _timeController.text));
                          _resetFieldValues();
                          List<dynamic> allEvents=await HiveHelper.getBox(boxName: HiveBoxNames.events);
                          print(allEvents);
                }))
          ],),
      ),
    ),
  );
}


  Widget _displayEvents() {
    return Consumer<EventsListenerProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(children: [
          if(value.allEvents.isEmpty)
            const Center(child: Padding(
              padding: EdgeInsets.all(38.0),
              child: Text(AppConstants.noEvents),
            )),
          for(int i=0;i<value.allEvents.length;i++)
        CustomCards.eventCard(
        event:value.allEvents[i].title,
            date: value.allEvents[i].eventDate.toString().split(' ')[0],
            time: value.allEvents[i].eventTime.toString(),
            remainderTime: value.allEvents[i].remainderTime
        )
        ],);
      },
    );
  }


   void _resetFieldValues(){
  ResetProviders.resetHomeProviders(context: context);
  _eventController.text='';
  _timeController.text='';
  _remainderTimeController.text='';
  _dateController.text='';
}


Future<void> _addEventHive({required String eventTitle,required String eventTime,
  required String remainderTime,required DateTime eventDate}) async {
  await HiveHelper.addEventInBox(boxName: 'events', key: _eventController.text, value:
  EventsModel(title: _eventController.text, remainderTime: remainderTime,
      eventDate:  eventDate, eventTime: eventTime));
  ScaffoldMessenger.of(context).showSnackBar(SnackBars.showSnackBar(message: 'Event scheduled'));
  context.read<EventsListenerProvider>().listenEventsBox();
  Workmanager().registerOneOffTask(
    _eventController.text,
    _eventController.text,
    initialDelay:  DateFormatting.getDurationInSeconds(targetDateTime: eventDate),
    inputData: <String, dynamic>{'date': eventDate.toString().split(' ')[0],'time':eventTime,'title':eventTitle}, // Optional data for the task
    constraints: Constraints(
      networkType: NetworkType.not_required,
      requiresCharging: false,
    ),
  );

}


}
