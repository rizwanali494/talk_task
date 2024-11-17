
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_constants.dart';
import '../../../utilis/hive_box_names.dart';
import '../../../view_model/recurring_event_provider.dart';
import '../../common_widgets/custom_text.dart';

class SelectableButtonWidget extends StatefulWidget {
  const SelectableButtonWidget({super.key});

  @override
  _SelectableButtonWidgetState createState() => _SelectableButtonWidgetState();
}

class _SelectableButtonWidgetState extends State<SelectableButtonWidget> {
  int _selectedIndex = 0;
  final List<String> _listBoxNames=[
    HiveBoxNames.weeklyEvents,
    HiveBoxNames.monthlyEvents,
    HiveBoxNames.yearlyEvents
  ];


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
            context.read<RecurringvEventsProvider>().selectedTenure=_listBoxNames[index];
            context.read<RecurringvEventsProvider>().listenEventsBox();
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
