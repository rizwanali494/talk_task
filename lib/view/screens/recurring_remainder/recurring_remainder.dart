import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_routes.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import 'package:talk_task/view/screens/setting_screen/setting_screen.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../../view_model/events_listner_provider.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_buttons.dart';
import '../../common_widgets/custom_cards.dart';
import '../../common_widgets/custom_text_fields.dart';
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
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.whiteFFFFF,
      appBar: AppBars.appBarHomeScreens(title: AppConstants.recurringRemainders,
          leadingBtnIcon: AppImages.iconNotifications, trailingBtnIcon: AppImages.iconSettings,
          leadingOnpressed: (){

            Navigator.push(context, MyRoute(const NotificationScreen()));
          }, tailingOnpressed: (){
        Navigator.push(context, MyRoute(const SettingScreen()));
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
      height: 1.sh*0.63,
      width: 1.sw,
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
              Center(child:CustomText(text: AppConstants.addTask,color: AppColors.blueDark002055,fontSize: 20.sp,fontWeight: FontWeight.w700,))
              , Image.asset(AppImages.iconMicrophone,height: 200.h,color: AppColors.secondary,)
              ,  CustomFields.field(title: AppConstants.event, onPressed: (){}, controller: _eventController),
              Row(children: [
                 Expanded(child: CustomFields.field(title: AppConstants.monthlyRemainder, onPressed: (){},controller: _monthlyController)),
                SizedBox(width:10.w,),
                Expanded(child: CustomFields.field(title: AppConstants.yearlyRemainder, onPressed: (){}, controller: _yearlyController)),
              ],),
              Row(children: [
                Expanded(child: CustomFields.field(title: AppConstants.time, onPressed: (){}, controller: _timeController)),
                SizedBox(width:10.w,),
                Expanded(child: CustomFields.field(title: AppConstants.reminderTime, onPressed: (){}, controller: _remainderTimeController)),
              ],),
              SizedBox(height: 8.h,)
              ,SizedBox(
                  width: 1.sw*0.9,
                  child: Buttons.customElevatedButton(title: AppConstants.addEvent, backgroundColor: AppColors.greyDark6C6D6D.withOpacity(0.5), textColor: AppColors.whiteFFFFF, onPressed: (){}))
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


}
