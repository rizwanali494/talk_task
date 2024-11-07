import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_task/utilis/app_images.dart';
import '../../main.dart';
import '../../utilis/app_colors.dart';
import '../../utilis/app_prefs.dart';
import '../../utilis/app_routes.dart';
import '../common_widgets/custom_text.dart';
import '../screens/bottom_screen.dart';
import 'DemoWidgets/demo_1_widget.dart';
import 'DemoWidgets/demo_2_widget.dart';
import 'DemoWidgets/demo_3_widget.dart';
import 'DemoWidgets/demo_4_widget.dart';
import 'DemoWidgets/demo_5_widget.dart';
import 'DemoWidgets/demo_6_widget.dart';


class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _onNextPressed() async {
    _currentPage++;
    if (_currentPage < 6) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(context, MyRoute(BottomScreen()));
      prefs.setBool(AppPrefs.onDemoShown, true);
    }
  }

  @override
  void initState() {
   //init();
    super.initState();
  }

//   init() async {// Name of the time zone, e.g., "America/New_York"
// final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
//     FirebaseFirestore.instance.collection("Users").doc(token).set({
//       "FCM": token,
//       "NotificationOpenned": true,
//       'timezone': currentTimeZone,
//     });
//   }

  @override
  Widget build(BuildContext context) {
    final height = 1.sh;
    final width = 1.sw;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,

        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: AppColors.greyLight),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                ///
                /// -----> Demo Page 1
                ///
                Demo1Widget(
                  height: height,
                  width: width,
                  onWidgetTap: _onNextPressed,
                  onNextTap: _onNextPressed,
                  onHandIconTap: _onNextPressed,
                ),

                ///
                /// -----> Demo Page 2
                ///
                Demo2Widget(
                  height: height,
                  width: width,
                  onWidgetTap: _onNextPressed,
                  onNextTap: _onNextPressed,
                  onHandIconTap: _onNextPressed,
                ),

                ///
                /// -----> Demo Page 3
                ///
                Demo3Widget(
                  height: height,
                  width: width,
                  onHandIconTap: _onNextPressed,
                  onWidgetTap: _onNextPressed,
                  onNextTap: _onNextPressed,
                ),

                ///
                /// -----> Demo Page 4
                ///
                Demo4Widget(
                  height: height,
                  width: width,
                  onWidgetTap: _onNextPressed,
                  onNextTap: _onNextPressed,
                  onSkipTap: () async {
                    Navigator.pushReplacement(context, MyRoute(BottomScreen()));
                    prefs.setBool(AppPrefs.onDemoShown, true);
                  },
                ),

                ///
                /// -----> Demo Page 5
                ///
                Demo5Widget(
                  height: height,
                  width: width,
                  onWidgetTap: _onNextPressed,
                  onNextTap: _onNextPressed,
                  onSkipTap: () async {
                    Navigator.pushReplacement(context, MyRoute(BottomScreen()));
                    prefs.setBool(AppPrefs.onDemoShown, true);
                  },
               ),

                ///
                /// -----> Demo Page 6
                ///
                Demo6Widget(
                  height: height,
                  width: width,
                  onWidgetTap: _onNextPressed,
                  onFinishedTap: _onNextPressed,
                  onHandIconTap: _onNextPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DemoNextButton extends StatelessWidget {
  const DemoNextButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    double height = 1.sh;
    double width = 1.sw;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * 0.035,
        width: width * 0.15,
        decoration: BoxDecoration(
          color: AppColors.whiteFFFFF,
          borderRadius: BorderRadius.circular(9.r),
        ),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: 10.sp,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// class BottomTrianglePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = primaryColor
//       ..style = PaintingStyle.fill;

//     final path = Path()
//       ..moveTo(0, 0)
//       ..lineTo(size.width / 2, size.height)
//       ..lineTo(size.width, 0)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

class BlurryHomeScreen extends StatelessWidget {
  const BlurryHomeScreen({super.key, required this.isShowIcon});
  final bool isShowIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
      //  BlurScreen(isShowIcon: isShowIcon), // Your original HomeScreen widget
       Image.asset(AppImages.imgDemoThreeBackGround),
        // BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
        //   child: Container(
        //     color:
        //         Colors.black.withOpacity(0.5), // Adjust the opacity as needed
        //   ),
        // ),
      ],
    );
  }
}
