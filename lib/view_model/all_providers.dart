

import 'package:provider/provider.dart';
import 'package:talk_task/view_model/setting_provider.dart';
import 'bottom_nav_bar_provider.dart';
import 'call_picking_provider.dart';
import 'customization_screen_provider.dart';

List<ChangeNotifierProvider> listProviders=[
  ChangeNotifierProvider(create: (context) => SettingProvider(),),
  ChangeNotifierProvider(create: (context) => CustomizationProvider(),),
  ChangeNotifierProvider(create: (context) => BottomNavBarProvider(),),
  ChangeNotifierProvider(create: (context) => CallPickingProvider(),),

];