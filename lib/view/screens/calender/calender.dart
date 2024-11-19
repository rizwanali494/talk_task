import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_constants.dart';
import '../../../view_model/events_listner_provider.dart';
import '../../../view_model/provider_list.dart';
import '../../common_widgets/custom_app_bars.dart';
import '../../common_widgets/custom_text.dart';
import 'date_calender.dart';



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
      appBar: AppBars.settingsAppBar(context: context, title: AppConstants.tasks,showLeading: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.h,),
            const CalenderDateUI(),
          Padding(
            padding:  EdgeInsets.only(left: 16.w),
            child: CustomText(text: AppConstants.recentlyAdded,
              fontWeight: FontWeight.w700,fontSize: 20.sp,color: AppColors.blueDark002055,),
          ),
          SizedBox(height: 5.h,),
          //_displayEvents()
        ],),
      ),
    );
  }



}
