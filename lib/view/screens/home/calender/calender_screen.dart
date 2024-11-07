import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view_model/customization_screen_provider.dart';
import '../../../../utilis/app_colors.dart';
import '../../../../view_model/calender_provider.dart';
import '../../../common_widgets/custom_text.dart';


class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {

  @override
  void initState() {
    super.initState();
    Provider
        .of<CalenderProvider>(context, listen: false)
        .selectedDate = null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(

      child: SfCalendar(
        initialDisplayDate: DateTime.now(),
        view: CalendarView.month,
        cellBorderColor: AppColors.transparent,
        firstDayOfWeek: 1,
        showNavigationArrow: true,
        onSelectionChanged: (calenderDetails) {
          context.read<CalenderProvider>().selectDate(calenderDetails.date!);
        },
        headerHeight: 1.sh * 0.07,
        viewHeaderHeight: 1.sh * 0.04,
        headerStyle: CalendarHeaderStyle(
          backgroundColor: AppColors.transparent,
          textStyle: AppTextStyles.poppins(
            color: AppColors.primary,
            fontSize: 1.sh * 0.022, weight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        viewHeaderStyle: ViewHeaderStyle(
          dayTextStyle: AppTextStyles.poppins(
            color: AppColors.black,
            fontSize: 1.sh * 0.019,
            weight: FontWeight.w600,
          ),
          dateTextStyle: AppTextStyles.poppins(
            color: AppColors.primary,
            fontSize: 1.sh * 0.015,
            weight: FontWeight.w600,
          ),
        ),
        monthCellBuilder:
            (BuildContext context, MonthCellDetails details) {
          // Define a list of dates and their corresponding colors
      
          final DateTime date = details.date;
          String formattedDate =
          DateFormat('yyyy-MM-dd').format(details.date);
      
          // int eventCount = eventCountByDate[formattedDate] ?? 0;
          int eventCount = 0;
          // Check if there are more than 3 events and change the background color to blue
          Color cellColor = eventCount == 1
              ? Color(context
              .read<CustomizationProvider>()
              .eventColor1)
              : eventCount == 2
              ? Color(context
              .read<CustomizationProvider>()
              .eventColor2)
              : eventCount == 0
              ? Colors.transparent
              : Color(
              context
                  .read<CustomizationProvider>()
                  .eventColor3);
      
          return CircleAvatar(
            backgroundColor: cellColor,
            child: CustomText(
              text: date.day.toString(),
              color: eventCount != 0
                  ? Colors.white
                  : details.visibleDates[10].month ==
                  details.date.month
                  ? AppColors.black // Current month in black
                  : AppColors.black.withOpacity(0.7),
              fontWeight: FontWeight.w500,
              fontSize: 1.sh * 0.015,
            ),
          );
        },
      ),
    );
  }
}
