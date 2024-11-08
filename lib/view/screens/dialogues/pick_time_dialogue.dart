import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_constants.dart';
import 'package:talk_task/utilis/app_colors.dart';
import '../../common_widgets/custom_buttons.dart';
import '../../common_widgets/custom_text.dart';

class PickTimeDialogue extends StatefulWidget {
  const PickTimeDialogue({super.key});

  @override
  State<PickTimeDialogue> createState() => _PickTimeDialogueState();
}

class _PickTimeDialogueState extends State<PickTimeDialogue> {
  int _selectedHour = 6;   // Default hour
  int _selectedMinute = 28; // Default minute
  String _selectedPeriod = "AM"; // Default AM/PM

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      contentPadding: EdgeInsets.zero,
      content: Container(
        color: AppColors.whiteFFFFF,
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 14.h, bottom: 14.h),
              child: CustomText(
                text: AppConstants.setTime,
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),

            Container(
              height: 200.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hour Selector
                  SizedBox(
                    width: 50.w,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 45.h,
                      diameterRatio: 1.2,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          _selectedHour = (index + 1) % 12 == 0 ? 12 : (index + 1) % 12;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 12,
                        builder: (context, index) {
                          int hour = (index + 1) % 12 == 0 ? 12 : (index + 1) % 12;
                          return CustomText(
                            text: hour.toString().padLeft(2, '0'),
                            color: _selectedHour == hour ? AppColors.black : AppColors.grey787878,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                          );
                        },
                      ),
                    ),
                  ),
                  // Colon separator with no extra spaces
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: CustomText(
                      text: ':',
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ),
                  // Minute Selector
                  SizedBox(
                    width: 50.w,
                    child: ListWheelScrollView.useDelegate(
                      itemExtent: 45.h,
                      diameterRatio: 1.2,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          _selectedMinute = index;
                        });
                      },
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: 60,
                        builder: (context, index) {
                          return CustomText(
                            text: index.toString().padLeft(2, '0'),
                            color: _selectedMinute == index ? AppColors.black : AppColors.grey787878,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                          );
                        },
                      ),
                    ),
                  ),
                  // AM/PM Selector
                  SizedBox(
                    width: 50.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedPeriod = "AM";  // AM selection
                            });
                          },
                          child: CustomText(
                            text: "AM",
                            color: _selectedPeriod == "AM"
                                ? AppColors.black
                                : AppColors.grey787878,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedPeriod = "PM";  // PM selection
                            });
                          },
                          child: CustomText(
                            text: "PM",
                            color: _selectedPeriod == "PM"
                                ? AppColors.black
                                : AppColors.grey787878,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
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
                        Navigator.of(context).pop(false);  // Close the dialog on cancel
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
                        // Format selected time as HH:mm AM/PM (e.g., 06:28 AM)
                        String formattedTime =
                            '${_selectedHour.toString().padLeft(2, '0')}:${_selectedMinute.toString().padLeft(2, '0')} $_selectedPeriod';
                        print('Selected time: $formattedTime');
                        Navigator.pop(context, formattedTime); // Return the selected time
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
