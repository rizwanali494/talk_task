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
                text: AppConstants.setTime,  // Using AppConstants to define the text
                fontSize: 18.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              height: 250.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Hour Selector
                  Expanded(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 3, // Display only 3 items at a time
                          itemBuilder: (context, index) {
                            int hourIndex = (_selectedHour - 1 + index) % 12;
                            if (hourIndex == 0) hourIndex = 12;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedHour = hourIndex;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: CustomText(
                                  text: '$hourIndex', // Hour (1 to 12)
                                  color: _selectedHour == hourIndex
                                      ? AppColors.black
                                      : AppColors.grey787878,
                                  fontWeight: FontWeight.w600, // Weight 600
                                  fontSize: 24.sp,
                                ),
                              ),
                            );
                          },
                        ),
                        Divider(color: AppColors.grey787878, height: 1.h),
                      ],
                    ),
                  ),
                  // Minute Selector
                  Expanded(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 3, // Display only 3 items at a time
                          itemBuilder: (context, index) {
                            int minuteIndex = (_selectedMinute + index) % 60;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedMinute = minuteIndex;
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: CustomText(
                                  text: minuteIndex.toString().padLeft(2, '0'), // Minute (00 to 59)
                                  color: _selectedMinute == minuteIndex
                                      ? AppColors.black
                                      : AppColors.greyLight,
                                  fontWeight: FontWeight.w600, // Weight 600
                                  fontSize: 24.sp,
                                ),
                              ),
                            );
                          },
                        ),
                        Divider(color: AppColors.grey787878, height: 1.h),
                      ],
                    ),
                  ),
                  // AM/PM Selector
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                            fontWeight: FontWeight.w600, // Weight 600
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
                            fontWeight: FontWeight.w600, // Weight 600
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
                        Navigator.pop(context);  // Close the dialog on cancel
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
