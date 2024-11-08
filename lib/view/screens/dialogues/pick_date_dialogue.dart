import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import 'package:talk_task/view_model/customization_screen_provider.dart';
import '../../../utilis/app_colors.dart';
import '../../../view_model/calender_provider.dart';
import '../../common_widgets/custom_buttons.dart';
import '../../common_widgets/custom_text.dart';

class PickDateDialogue extends StatefulWidget {
  @override
  State<PickDateDialogue> createState() => _PickDateDialogueState();
}

class _PickDateDialogueState extends State<PickDateDialogue> {
  DateTime? _selectedDate;
  // Track selected date
  @override
  void initState() {
    super.initState();
    Provider.of<CalenderProvider>(context, listen: false).selectedDate = null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        color: AppColors.whiteFFFFF,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 14.h, bottom: 14.h),
              child: CustomText(
                text: AppConstants.setDate,
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 360.h,
              margin: EdgeInsets.symmetric(horizontal: 7.w),
              decoration: BoxDecoration(
                color: AppColors.whiteFFFFF,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.grey787878.withOpacity(0.4),
                      spreadRadius: 0.1,
                      blurRadius: 0.3)
                ],
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: SfCalendar(
                initialDisplayDate: DateTime.now(),
                view: CalendarView.month,
                cellBorderColor: AppColors.transparent,
                firstDayOfWeek: 1,
                showNavigationArrow: true,
                onSelectionChanged: (calenderDetails) {
                  // Update the selected date
                  setState(() {
                    _selectedDate = calenderDetails.date;
                  });
                  context.read<CalenderProvider>().selectDate(calenderDetails.date!);
                },
                headerHeight: 60.h,
                viewHeaderHeight: 30.h,
                headerStyle: CalendarHeaderStyle(
                  backgroundColor: AppColors.transparent,
                  textStyle: AppTextStyles.poppins(
                    color: AppColors.primary,
                    fontSize: 20.sp,
                    weight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                viewHeaderStyle: ViewHeaderStyle(
                  dayTextStyle: AppTextStyles.poppins(
                    color: AppColors.black,
                    fontSize: 15.sp,
                    weight: FontWeight.w500,
                  ),
                  dateTextStyle: AppTextStyles.poppins(
                    color: AppColors.primary,
                    fontSize: 15.sp,
                    weight: FontWeight.w500,
                  ),
                ),
                monthCellBuilder:
                    (BuildContext context, MonthCellDetails details) {
                  final DateTime date = details.date;
                  String formattedDate = DateFormat('yyyy-MM-dd').format(details.date);

                  // Check if this is the selected date
                  bool isSelected = _selectedDate != null && _selectedDate!.isAtSameMomentAs(date);

                  // Set cell color based on selection
                  Color cellColor = isSelected
                      ? AppColors.primary // Background color for selected date
                      : (date.month == DateTime.now().month
                      ? AppColors.transparent
                      : AppColors.transparent);

                  return ClipOval(  // Use ClipOval to maintain a circular shape for the selected date
                    child: Container(
                      color: cellColor, // Background color for selected date
                      child: Center(
                        child: CustomText(
                          text: date.day.toString(),
                          color: isSelected
                              ? AppColors.whiteFFFFF // Text color for selected date
                              : (date.month == DateTime.now().month
                              ? AppColors.black
                              : AppColors.black.withOpacity(0.7)),
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Buttons.customCalenderDateButton(
                        title: AppConstants.cancel,
                        backgroundColor: AppColors.whiteFFFFF,
                        textColor: AppColors.grey787878,
                        onPressed: () {}),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Buttons.customCalenderDateButton(
                        title: AppConstants.save,
                        backgroundColor: AppColors.secondary,
                        textColor: AppColors.whiteFFFFF,
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
