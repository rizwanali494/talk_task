import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talk_task/services/background_tasks.dart';
import 'package:talk_task/services/hive_service.dart';
import 'package:talk_task/services/local_notification_service.dart';
import 'package:talk_task/splash_screen.dart';
import 'package:talk_task/utilis/app_images.dart';
import 'package:talk_task/utilis/app_themes.dart';
import 'package:talk_task/view_model/bottom_nav_bar_provider.dart';
import 'package:talk_task/view_model/call_picking_provider.dart';
import 'package:talk_task/view_model/customization_screen_provider.dart';
import 'package:talk_task/view_model/date_picker_provider.dart';
import 'package:talk_task/view_model/events_listner_provider.dart';
import 'package:talk_task/view_model/recurring_days_provider.dart';
import 'package:talk_task/view_model/recurring_event_provider.dart';
import 'package:talk_task/view_model/setting_provider.dart';
import 'package:talk_task/view_model/time_picking_provider.dart';
import 'package:workmanager/workmanager.dart';




@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    NotificationService.initialize();
    NotificationService.showNotification(title: inputData?['title']??'', description: inputData?['date']??'');
     simpleTaskCallback(task:task,data:inputData);
    return Future.value(true);
  });
}

late SharedPreferences prefs;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs=await SharedPreferences.getInstance();
  NotificationService.initialize();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  HiveHelper.initHive();
  runApp( const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
}


class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     get();
    _preChacheImages(context);
   return MultiProvider(
     providers: [
       ChangeNotifierProvider(create: (context) => SettingProvider(),),
       ChangeNotifierProvider(create: (context) => CustomizationProvider(),),
       ChangeNotifierProvider(create: (context) => BottomNavBarProvider(),),
       ChangeNotifierProvider(create: (context) => DatePickerProvider(),),
       ChangeNotifierProvider(create: (context) => CallPickingProvider(),),
       ChangeNotifierProvider(create: (context) => TimePickerProvider(),),
       ChangeNotifierProvider(create: (context) => RemainderTimePickerProvider(),),
       ChangeNotifierProvider(create: (context) => EventsListenerProvider(),),
       ChangeNotifierProvider(create: (context) => DaySelectionProvider(),),
       ChangeNotifierProvider(create: (context) => RecurringvEventsProvider(),),

     ],
     child: ScreenUtilInit(
       designSize: const Size(432,923),
       child: MaterialApp(
         builder: EasyLoading.init(),
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

Future<void> get() async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory.path);
}
}
