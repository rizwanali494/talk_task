import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import 'package:talk_task/view/screens/setting_screen/setting_screen.dart';
import 'package:talk_task/view_model/recurring_event_provider.dart';
import 'package:talk_task/view_model/stream_button.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../../view_model/provider_list.dart';
import '../../../view_model/recurring_days_provider.dart';
import '../../../view_model/time_picking_provider.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_buttons.dart';
import '../../common_widgets/custom_cards.dart';
import '../../common_widgets/custom_text_fields.dart';
import '../../dialogues/home_menu_dialogue.dart';
import '../../dialogues/pick_time_dialogue.dart';
import '../notification_screen/notification_screen.dart';


class RecurringRemainders extends StatefulWidget {
  const RecurringRemainders({super.key});

  @override
  State<RecurringRemainders> createState() => _RemainderState();
}



class _RemainderState extends State<RecurringRemainders> {

  final TextEditingController _eventController= TextEditingController();
  final TextEditingController _monthlyController= TextEditingController();
  final TextEditingController _yearlyController= TextEditingController();
  final TextEditingController _timeController= TextEditingController();
  final TextEditingController _remainderTimeController= TextEditingController();
  final List<String>  _listDays = ["M", "Tu", "W", "Th", "F", "Sa", "Su"];


  @override
  void initState() {
    super.initState();
    BooleanStreamManagerRecurringScreen.updateValue(false);
    WidgetsBinding.instance.addPostFrameCallback((a){
      _resetFieldValues();
      context.read<RecurringvEventsProvider>().listenEventsBox();
    });
  }


  void _checkFormValidity() {
    bool isValid = _eventController.text.isNotEmpty &&
        context.read<DaySelectionProvider>().selectedDays.contains(true) &&
        _timeController.text.isNotEmpty &&
        _remainderTimeController.text.isNotEmpty;
    if (isValid) {
      print(isValid);
      BooleanStreamManagerRecurringScreen.updateValue(true);
    } else {
      print(isValid);
      BooleanStreamManagerRecurringScreen.updateValue(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteFFFFF,
      appBar: AppBars.appBarHomeScreens(title: AppConstants.recurringRemainders,
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
              SizedBox(height: 7.h,),
              _cardAddEvent(),
              Padding(
                padding:  EdgeInsets.only(left: 16.w),
                child: CustomText(text: AppConstants.upcomingEvents,fontWeight: FontWeight.w700,fontSize: 20.sp,),

              ),
              SizedBox(height: 5.h,),
              _displayEvents()
            ],)),
    );
  }


  Widget _cardAddEvent(){
    return Container(
      height: 1.sh*0.66,
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 7.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.whiteFFFFF,
          boxShadow: const [BoxShadow(color: AppColors.blueBorder,spreadRadius: 0.4,blurRadius: 1.0)]
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h,),
              Center(child:CustomText(text: AppConstants.addTask,color: AppColors.blueDark002055,fontSize: 20.sp,fontWeight: FontWeight.w700,))
              , Center(child: Image.asset(AppImages.iconMicrophone,height: 185.h,color: AppColors.secondary,)),
              const SelectableButtonWidget(),
               SizedBox(height: 15.h,),
               CustomFields.field(
                  isReadOnly: false,
                  title: AppConstants.event, onPressed: (){}, controller: _eventController,
              onChanged: (a){
                _checkFormValidity();
              }
              ),
              SizedBox(height: 5.h,),
              CustomText(text:AppConstants.dailyWeeklyRemainder ,color: AppColors.grey787878, fontSize: 17.sp, fontWeight: FontWeight.w400),
              daySelector(context),
              SizedBox(height: 5.h,),
              Row(children: [
                Consumer<TimePickerProvider>(
                  builder: (BuildContext context,  value, Widget? child) {
                    if(value.isTimeSelected){
                      _timeController.text="${value.hours} : ${value.minutes} ${value.timeFormat}";
                      _checkFormValidity();
                    }
                    return Expanded(
                      child: CustomFields.field(title: AppConstants.time, onPressed: (){
                        showDialog(context: context, builder: (context)=> const PickTimeDialogue(isRemainderTimePicker: false,));
                      }, controller: _timeController),
                    );
                  },

                )
                ,
                SizedBox(width:10.w,),
                Consumer<RemainderTimePickerProvider>(
                  builder: (BuildContext context,  value, Widget? child) {
                    if(value.isTimeSelected){
                      _remainderTimeController.text="${value.hours} : ${value.minutes} ${value.timeFormat}";
                      _checkFormValidity();
                    }
                    return Expanded(
                      child: CustomFields.field(title: AppConstants.reminderTime, onPressed: (){
                        showDialog(context: context, builder: (context)=> const PickTimeDialogue(isRemainderTimePicker: true,));
                      }, controller: _remainderTimeController),
                    );
                  },
                ),

              ],),
              SizedBox(height: 8.h,)
              ,StreamBuilder<bool>(
                  builder: (context,snap) {
                    return SizedBox(
                        width: 1.sw*0.9,
                        child: Buttons.customElevatedButton(title: AppConstants.addEvent,
                            backgroundColor:snap.data== true
                                ? AppColors.blue05AAEC
                                : AppColors.greyDark6C6D6D.withOpacity(0.5),
                            textColor: AppColors.whiteFFFFF, onPressed: (){
                              context.read<RecurringvEventsProvider>().addRecurringEventHive(
                                eventTitle: _eventController.text,
                                eventTime: _timeController.text,
                                remainderTime: _remainderTimeController.text,
                                repeatingDays: context.read<DaySelectionProvider>().selectedDays,
                                context: context,
                              );

                              _resetFieldValues();
                              _checkFormValidity();

                            }, isDisabled: snap.data==true ? false:true ));
                  }, stream: BooleanStreamManagerRecurringScreen.boolStream,
              )
            ],),
        ),
      ),
    );
  }


  Widget _displayEvents() {
    return Consumer<RecurringvEventsProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Column(children: [
          if(value.allRecurringEvents.isEmpty)
            const Center(child: Padding(
              padding: EdgeInsets.all(38.0),
              child: Text(AppConstants.noEvents),
            )),
          for(int i=0;i<value.allRecurringEvents.length;i++)
            CustomCards.eventCard(
                event:value.allRecurringEvents[i].title,
                date: value.allRecurringEvents[i].eventScheduledDate.toString().split(' ')[0],
                time: value.allRecurringEvents[i].eventTime.toString(),
                remainderTime: value.allRecurringEvents[i].remainderTime
            )
        ],);
      },
    );
  }



  Widget daySelector(BuildContext context) {
    return Consumer<DaySelectionProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_listDays.length, (index) {
              return GestureDetector(
                onTap: () {
                  context.read<DaySelectionProvider>().toggleDay(index);
                  _checkFormValidity();
                },
                child: Container(
                  height: 51.h,
                  width: 51.h,
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.blue05AAEC,
                      width: 2.r,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 25.r, // Inner circle radius
                    backgroundColor: provider.selectedDays[index]
                        ? AppColors.blue05AAEC
                        : AppColors.primary.withOpacity(0.2),
                    child: CustomText(
                      text: _listDays[index],
                      color: provider.selectedDays[index]
                          ? AppColors.whiteFFFFF
                          : AppColors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }




  void _resetFieldValues(){
    ResetProviders.resetHomeProviders(context: context);
    _eventController.text='';
    _timeController.text='';
    _remainderTimeController.text='';

  }


}










class SelectableButtonWidget extends StatefulWidget {
  const SelectableButtonWidget({Key? key}) : super(key: key);

  @override
  _SelectableButtonWidgetState createState() => _SelectableButtonWidgetState();
}

class _SelectableButtonWidgetState extends State<SelectableButtonWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSelectableButton(0, AppConstants.weekly),
        _buildSelectableButton(1, AppConstants.monthly),
        _buildSelectableButton(2, AppConstants.yearly),
      ],
    );
  }

  Widget _buildSelectableButton(int index, String title) {
    bool isSelected = _selectedIndex == index;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? AppColors.whiteFFFFF : AppColors.black,
        backgroundColor: isSelected ? AppColors.blue05AAEC : AppColors.whiteFFFFF,
        side: BorderSide(
          width: 1.4,
          color: isSelected ? AppColors.blue05AAEC : AppColors.blue05AAEC.withOpacity(0.9),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: CustomText(text: title,color:isSelected ? AppColors.whiteFFFFF : AppColors.black,fontSize: 16.sp,fontWeight: FontWeight.w400,)
    );
  }
}

//
// if(_eventController.text.replaceAll(' ', '').isEmpty){
// EasyLoading.showInfo(AppMessages.eventNameRequired);
// return;
// }
// if(!context.read<DaySelectionProvider>().selectedDays.contains(true)){
// EasyLoading.showInfo(AppMessages.selectRepeatingDays);
// return;
// }
//
// if(_timeController.text.isEmpty){
// EasyLoading.showInfo(AppMessages.eventTimeRequired);
// return;
// }
// if(_remainderTimeController.text.isEmpty){
// EasyLoading.showInfo(AppMessages.eventRemainderRequired);
// return;
// }
