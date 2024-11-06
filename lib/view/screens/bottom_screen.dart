




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/view/screens/home/home_screen.dart';
import 'package:talk_task/view/screens/notes/notes.dart';
import 'package:talk_task/view/screens/remainders/remainders.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_images.dart';
import '../../view_model/bottom_nav_bar_provider.dart';
import '../common_widgets/custom_app_bars.dart';




class BottomScreen extends StatelessWidget{
   BottomScreen({super.key});
  final List<String> _listIcons=[AppImages.iconNotes,AppImages.iconHome,AppImages.iconCalender];
final List<Widget> _screens=[const NotesScreen(),const HomeScreen(),const Remainders()];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBars.authAppBars(bgColor: AppColors.whiteFFFFF, iconBrightness: Brightness.dark),
       body: Consumer<BottomNavBarProvider>(builder: (BuildContext context, BottomNavBarProvider value, Widget? child) {
         return _screens[value.selectedIndex];
       }),

       bottomNavigationBar: Container(
         height: 57.h,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.only(
             topRight: Radius.circular(25.r),
             topLeft: Radius.circular(25.r),
           ),
           border: Border.all(color: AppColors.primary),
         ),
         child: ClipRRect(
             borderRadius: BorderRadius.only(
               topLeft: Radius.circular(25.r),

               topRight: Radius.circular(25.r),
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 _bottomIconBtn(iconPath: _listIcons[0], isSelected: false),
                 _bottomIconBtn(iconPath: _listIcons[1], isSelected: false),
                 _bottomIconBtn(iconPath: _listIcons[2], isSelected: false),
               ],
             )),
       ),
   );
  }


  Widget _bottomIconBtn({required String iconPath,required bool isSelected}){
    return SizedBox(
      width: 100.w,
      height: 50.h,
      child: Center(
        child: Image.asset(
          iconPath,
          height: 30.h,
          width: 30.h,
          color:isSelected
              ? AppColors.primary
              : AppColors.greyLight,
        ),
      ),
    );
  }

}