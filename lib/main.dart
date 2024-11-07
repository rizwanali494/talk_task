import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talk_task/splash_screen.dart';
import 'package:talk_task/utilis/app_images.dart';
import 'package:talk_task/utilis/app_themes.dart';
import 'package:talk_task/view_model/bottom_nav_bar_provider.dart';
import 'package:talk_task/view_model/calender_provider.dart';
import 'package:talk_task/view_model/call_picking_provider.dart';
import 'package:talk_task/view_model/customization_screen_provider.dart';
import 'package:talk_task/view_model/setting_provider.dart';


late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs=await SharedPreferences.getInstance();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    _preChacheImages(context);
   return MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => SettingProvider(),),
       ChangeNotifierProvider(create: (context) => CustomizationProvider(),),
       ChangeNotifierProvider(create: (context) => BottomNavBarProvider(),),
       ChangeNotifierProvider(create: (context) => CalenderProvider(),),
       ChangeNotifierProvider(create: (context) => CallPickingProvider(),),

     ],
     child: ScreenUtilInit(
       designSize: const Size(432,923),
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: const SplashScreen(),
        ),
     ),
   );
  }



  _preChacheImages(context){
    precacheImage(AssetImage(AppImages.imgBoardingFirst), context);
    precacheImage(AssetImage(AppImages.imgBoardingSecond), context);
    precacheImage(AssetImage(AppImages.imgBoardingThird), context);
    precacheImage(AssetImage(AppImages.imgSplash), context);
  }
}
