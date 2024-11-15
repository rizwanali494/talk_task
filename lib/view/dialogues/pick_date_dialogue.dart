import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_text_styles.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_images.dart';
import '../../../view_model/date_picker_provider.dart';
import '../common_widgets/custom_buttons.dart';
import '../common_widgets/custom_text.dart';


class PickDateDialogue extends StatefulWidget {
  const PickDateDialogue({super.key}) ;

  @override
  State<PickDateDialogue> createState() => _PickDateDialogueState();
}
class _PickDateDialogueState extends State<PickDateDialogue> {
  DateTime? _selectedDate;
  DateTime _currentDate = DateTime.now(); // Track the current month

  @override
  void initState() {
    super.initState();
    Provider.of<DatePickerProvider>(context, listen: false).selectedDate = null;
  }

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now().subtract(const Duration(days: 1)); // Get today's date

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
              child: Column(
                children: [
                  // Custom Header with navigation buttons
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Image.asset(AppImages.iconBackArrow, color: AppColors.black, height: 25.h),
                          onPressed: () {
                            setState(() {
                              _currentDate = DateTime(_currentDate.year, _currentDate.month - 1, 1);
                            });
                          },
                        ),
                        CustomText(
                          text: DateFormat('MMMM yyyy').format(_currentDate),
                          fontSize: 18.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        IconButton(
                          icon: Image.asset(AppImages.iconForward, color: AppColors.black, height: 25.h),
                          onPressed: () {
                            setState(() {
                              _currentDate = DateTime(_currentDate.year, _currentDate.month + 1, 1);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  // Calendar view
                  Expanded(
                    child: SfCalendar(
                      selectionDecoration: const BoxDecoration(),
                      initialDisplayDate: _currentDate,
                      view: CalendarView.month,
                      cellBorderColor: AppColors.transparent,
                      firstDayOfWeek: 1,
                      showNavigationArrow: false, // Disable default navigation arrows
                      onSelectionChanged: (calenderDetails) {
                        final DateTime selectedDate = calenderDetails.date!;
                        if (selectedDate.isBefore(today)) {
                          return; // Ignore selection if the date is before today
                        }

                        setState(() {
                          _selectedDate = selectedDate;
                        });
                        context.read<DatePickerProvider>().selectDate(selectedDate);
                      },

                      headerHeight: 0, // Hide default header
                      monthCellBuilder: (BuildContext context, MonthCellDetails details) {
                        final DateTime date = details.date;
                        bool isSelected = _selectedDate != null && _selectedDate!.isAtSameMomentAs(date);
                        bool isBeforeToday = date.isBefore(today);
                        Color textColor = isBeforeToday
                            ? AppColors.black.withOpacity(0.5)
                            : (isSelected
                            ? AppColors.whiteFFFFF // Selected date text color
                            : AppColors.black); // Default text color for future dates

                        // Cell background color remains unchanged for past dates
                        Color cellColor = isSelected
                            ? AppColors.primary // Background color for selected date
                            : AppColors.transparent; // No background color for other dates

                        return ClipOval(

                          child: Container(
                            decoration: BoxDecoration(shape: BoxShape.circle,
                              color: cellColor,
                            ),
                             // Only apply background color here
                            child: Center(
                              child: CustomText(
                                text: date.day.toString(),
                                color: textColor, // Apply text color
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        Provider.of<DatePickerProvider>(context, listen: false).selectedDate = null;
                      },
                    ),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Buttons.customCalenderDateButton(
                      title: AppConstants.save,
                      backgroundColor: AppColors.secondary,
                      textColor: AppColors.whiteFFFFF,
                      onPressed: () {
                        if (_selectedDate != null) {
                          context.read<DatePickerProvider>().selectDate(_selectedDate!);
                        }
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    ),
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
