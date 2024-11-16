import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/services/hive_service.dart';
import 'package:talk_task/services/permission_handler.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/utilis/hive_box_names.dart';
import 'package:talk_task/view/common_widgets/custom_cards.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import 'package:talk_task/view_model/event_title_provider.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../../utilis/date_formating.dart';
import '../../../view_model/date_picker_provider.dart';
import '../../../view_model/events_listner_provider.dart';
import '../../../view_model/provider_list.dart';
import '../../../view_model/record_event_provider.dart';
import '../../../view_model/stream_button.dart';
import '../../../view_model/time_picking_provider.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_buttons.dart';
import '../../common_widgets/custom_drawer.dart';
import '../../common_widgets/custom_text_fields.dart';
import '../../dialogues/home_menu_dialogue.dart';
import '../../dialogues/permissions_dialogue.dart';
import '../../dialogues/pick_date_dialogue.dart';
import '../../dialogues/pick_time_dialogue.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    BooleanStreamManager.updateValue(false);
    WidgetsBinding.instance.addPostFrameCallback((a){
      ResetProviders.resetHomeProviders(context: context);
      _resetFieldValues();
      context.read<EventsListenerProvider>().listenEventsBox();

    });
  }


  void _checkFormValidity() {
    bool isValid = _eventController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _timeController.text.isNotEmpty &&
        _remainderTimeController.text.isNotEmpty;
    if (isValid) {
      BooleanStreamManager.updateValue(true);
    } else {
      BooleanStreamManager.updateValue(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.whiteFFFFF,
      appBar:AppBars.appBarHomeScreens(title: AppConstants.taskAi,
          leadingBtnIcon: AppImages.iconUserPlus, trailingBtnIcon: AppImages.iconMenu, leadingOnpressed: (){
          }, tailingOnpressed: (){
           showDialog(
               barrierColor: AppColors.transparent,
               barrierDismissible: true,
               context: context, builder: (context)=>const HomeMenuDialogue());
          }) ,
      body:_body() ,

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


  Widget _cardAddEvent() {
    return Container(
      height: 1.sh * 0.63,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.whiteFFFFF,
          boxShadow: const [
            BoxShadow(
                color: AppColors.blueBorder, spreadRadius: 0.4, blurRadius: 1.0)
          ]
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.h,),
              Center(child: Text(AppConstants.addEvent,
                style: AppTextStyles.poppins(color: AppColors.blueDark002055,
                    fontSize: 20.sp,
                    weight: FontWeight.w700),))
              ,
              InkWell(
                onTap: () async {
                  bool permissionsGranted=false;
                  permissionsGranted=await PermissionHelper.checkAndRequestPermissions();
                  if(!permissionsGranted) {
                    showDialog(context: context, builder: (context) =>
                        PermissionsDialogue(title: AppConstants.allowMicrophone,
                          iconPath: AppImages.iconPermissionMicrophone,
                          callBack: () async {
                            permissionsGranted=await PermissionHelper.checkAndRequestPermissions();
                            if (permissionsGranted) {
                              Navigator.of(context).pop();
                            }
                          },));
                  }
                  else{
                    context.read<RecordEventProvider>().initializeRecorder();
                    context.read<RecordEventProvider>().startRecording(context);
                    context.read<RecordEventProvider>().listenToListeningStatus();

                  }

                },
                child: Consumer<RecordEventProvider>(
                  builder: (context,value,child) {
                    print('its still ${value.isRecording}');
                    return Image.asset(AppImages.iconMicrophone, height: 185.h,
                      color: value.isRecording ? AppColors.redFF0000:AppColors.secondary,);
                  }
                ),
              )
              ,
              Consumer<EventTitleProvider>(
                builder: (context,value,child) {
                  if(value.title.isNotEmpty){
                    _eventController.text=value.title;
                    _checkFormValidity();
                  }
                  return CustomFields.field(title: AppConstants.event,
                      onPressed: () {},
                      onChanged: (a){
                   // context.read()
                        _checkFormValidity();
                      },
                      controller: _eventController,
                      isReadOnly: false);
                }
              )
              ,

              Consumer<DatePickerProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    if (value.selectedDate != null) {
                      _dateController.text = value.selectedDate ?? "";
                      _checkFormValidity();
                    }
                    return CustomFields.field(
                        title: AppConstants.date, onPressed: () {
                      showDialog(
                        context: context,
                        builder: (
                            BuildContext context) => const PickDateDialogue(),
                      );
                    }, controller: _dateController);
                  }
              )
              ,
              Consumer<TimePickerProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  if (value.isTimeSelected) {
                    _timeController.text =
                    "${value.hours} : ${value.minutes} ${value.timeFormat}";
                    _checkFormValidity();
                  }
                  return CustomFields.field(
                      title: AppConstants.time, onPressed: () {
                    showDialog(context: context,
                        builder: (context) =>
                        const PickTimeDialogue(isRemainderTimePicker: false,));
                  }, controller: _timeController);
                },
              )

              ,
              Consumer<RemainderTimePickerProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  if (value.isTimeSelected) {
                    _remainderTimeController.text =
                    "${value.hours} : ${value.minutes} ${value.timeFormat}";
                    _checkFormValidity();
                  }
                  return CustomFields.field(
                      title: AppConstants.reminderTime, onPressed: () {
                    showDialog(context: context,
                        builder: (context) =>
                        const PickTimeDialogue(isRemainderTimePicker: true,));
                  }, controller: _remainderTimeController);
                },

              ),


              SizedBox(height: 8.h,)
              ,
              SizedBox(
                  width: 1.sw * 0.9,
                  child: StreamBuilder<bool>(
                      builder: (context, snap) {
                        return Buttons.customElevatedButton(
                            title: AppConstants.addEvent,
                            backgroundColor:snap.data== true
                                ? AppColors.blue05AAEC
                                : AppColors.greyDark6C6D6D.withOpacity(0.5),
                            textColor: AppColors.whiteFFFFF,
                            onPressed: () async {
                              context.read<EventsListenerProvider>().addEventInHive(eventTitle: _eventController.text,
                                  eventTime: _timeController.text,
                                  remainderTime: _remainderTimeController.text,
                                  eventDate: DateFormatting
                                      .createDateTimeFromString(
                                      date: _dateController.text,
                                      time: _timeController.text),
                                  context: context);

                              _resetFieldValues();
                              _checkFormValidity();
                            },
                            isDisabled: snap.data==true ? false:true );
                      }, stream: BooleanStreamManager.boolStream,
                  ))
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



  @override
  void dispose() {
    _eventController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _remainderTimeController.dispose();
    super.dispose();
  }

}
