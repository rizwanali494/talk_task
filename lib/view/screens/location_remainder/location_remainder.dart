


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../services/permission_handler.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_constants.dart';
import '../../../utilis/app_images.dart';
import '../../../utilis/app_text_styles.dart';
import '../../../view_model/event_title_provider.dart';
import '../../../view_model/provider_list.dart';
import '../../../view_model/record_event_provider.dart';
import '../../../view_model/stream_button.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_buttons.dart';
import '../../common_widgets/custom_text.dart';
import '../../common_widgets/custom_text_fields.dart';
import '../../dialogues/home_menu_dialogue.dart';
import '../../dialogues/permissions_dialogue.dart';

class LocationRemainder extends StatelessWidget{
  final TextEditingController _eventController= TextEditingController();
  final TextEditingController _locationController= TextEditingController();
  final TextEditingController _notesController= TextEditingController();
   LocationRemainder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteFFFFF,
      appBar: AppBars.appBarHomeScreens(title: AppConstants.locationRemainder,
          leadingBtnIcon: AppImages.iconUserPlus, trailingBtnIcon: AppImages.iconMenu,
          leadingOnpressed: (){
          }, tailingOnpressed: (){
            showDialog(
                barrierColor: AppColors.transparent,
                barrierDismissible: true,
                context: context, builder: (context)=>const HomeMenuDialogue());
          }),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 12.h,),
          _cardAddEvent(context),
          Padding(
            padding:  EdgeInsets.only(left: 16.w),
            child: CustomText(text: AppConstants.upcomingEvents,fontWeight: FontWeight.w700,fontSize: 20.sp,color: AppColors.blueDark002055,),

          ),
          SizedBox(height: 5.h,),
         // _displayEvents()
        ],),
      ),
    );
  }




  Widget _cardAddEvent(BuildContext context) {
    return Container(
      height: 1.sh * 0.6,
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
              Center(child: Text(AppConstants.addTask,
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

              CustomFields.field(title: AppConstants.location,
                  onPressed: () {},
                  onChanged: (a){
                    // context.read()
                    _checkFormValidity();
                  },
                  controller: _locationController,
                  isReadOnly: false),

              SizedBox(height: 8.h,),
              CustomFields.field(title: AppConstants.notes,
                  onPressed: () {},
                  onChanged: (a){
                    // context.read()
                    _checkFormValidity();
                  },
                  controller: _notesController,
                  isReadOnly: false)
              ,
              SizedBox(height: 8.h,),
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
                            // context.read<EventsListenerProvider>().addEventInHive(eventTitle: _eventController.text,
                            //     eventTime: _timeController.text,
                            //     remainderTime: _remainderTimeController.text,
                            //     eventDate: DateFormatting
                            //         .createDateTimeFromString(
                            //         date: _dateController.text,
                            //         time: _timeController.text),
                            //     context: context);

                            _resetFieldValues(context);
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




  void _checkFormValidity() {
    bool isValid = _eventController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _notesController.text.isNotEmpty ;
    if (isValid) {
      BooleanStreamManager.updateValue(true);
    } else {
      BooleanStreamManager.updateValue(false);
    }
  }

// Widget _displayEvents() {
  //   return Consumer<RecurringvEventsProvider>(
  //     builder: (BuildContext context, value, Widget? child) {
  //       return Column(children: [
  //         if(value.allRecurringEvents.isEmpty)
  //           const Center(child: Padding(
  //             padding: EdgeInsets.all(38.0),
  //             child: Text(AppConstants.noEvents),
  //           )),
  //         for(int i=0;i<value.allRecurringEvents.length;i++)
  //           CustomCards.eventCard(
  //               event:value.allRecurringEvents[i].title,
  //               date: value.allRecurringEvents[i].eventScheduledDate.toString().split(' ')[0],
  //               time: value.allRecurringEvents[i].eventTime.toString(),
  //               remainderTime: value.allRecurringEvents[i].remainderTime
  //           )
  //       ],);
  //     },
  //   );
  // }


  void _resetFieldValues(BuildContext context){
    ResetProviders.resetHomeProviders(context: context);
    _eventController.text='';
    _locationController.text='';
    _notesController.text='';

  }




}