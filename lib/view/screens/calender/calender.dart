import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_constants.dart';
import '../../../view_model/events_listner_provider.dart';
import '../../../view_model/provider_list.dart';
import '../../common_widgets/custom_cards.dart';
import '../../common_widgets/custom_text.dart';



class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalenderScreen(),
          Padding(
            padding:  EdgeInsets.only(left: 16.w),
            child: CustomText(text: AppConstants.upcomingEvents,fontWeight: FontWeight.w700,fontSize: 20.sp,color: AppColors.blueDark002055,),
          ),
          SizedBox(height: 5.h,),
          _displayEvents()
        ],),
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
