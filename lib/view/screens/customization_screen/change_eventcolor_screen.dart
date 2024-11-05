// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
//
// class ChangeEventColorScreen extends StatefulWidget {
//   String eventCount;
//
//   ChangeEventColorScreen({super.key, required this.eventCount});
//
//   @override
//   State<ChangeEventColorScreen> createState() => _ChangeEventColorScreenState();
// }
//
// class _ChangeEventColorScreenState extends State<ChangeEventColorScreen> {
//   Color? selectedColor;
//   @override
//   Widget build(BuildContext context) {
//     var customizationProvider = Provider.of<CustomizationViewmodel>(context);
//     return SafeArea(
//         child: Scaffold(
//             appBar: PreferredSize(
//                 preferredSize: Size(double.infinity, 70.h),
//                 child: Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Image.asset(Asset.backIcon,
//                             width: 42.w, height: 42.h),
//                       ),
//                       CustomText(
//                         text: 'Customization',
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       SizedBox(width: 30.w)
//                     ],
//                   ),
//                 )),
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
//                 child: Consumer<SettingModel>(builder: (context, model, child) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 15.h),
//                       Center(
//                         child: Text(
//                           'Change Event Color',
//                           style: GoogleFonts.quicksand(
//                               fontSize: 25.sp,
//                               fontWeight: FontWeight.w700,
//                               color: blackColor),
//                         ),
//                       ),
//                       SizedBox(height: 60.h),
//                       ColorPicker(
//                         pickerColor: buttonColor,
//                         onColorChanged: (color) {
//                           selectedColor = color;
//                         },
//                         paletteType: PaletteType.hueWheel,
//                         displayThumbColor: true,
//                         enableAlpha: false,
//                         hexInputBar: true,
//                         labelTypes: const [],
//                         showLabel: false,
//                         // showLabel: false,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           SizedBox(
//                               width: 132.w,
//                               height: 40.h,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: const Color(0xFFE0E0E0),
//                                     shadowColor: greyColor,
//                                     elevation: 8.sp,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20.r),
//                                     )),
//                                 child: Text(
//                                   'Reset',
//                                   style: GoogleFonts.quicksand(
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w500,
//                                       color: blackColor),
//                                 ),
//                               )),
//                           SizedBox(
//                               width: 132.w,
//                               height: 40.h,
//                               child: ElevatedButton(
//                                 onPressed: () async {
//                                   customizationProvider.setColours(
//                                       widget.eventCount, selectedColor!);
//                                       Navigator.pop(context);
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                     shadowColor: greyColor,
//                                     elevation: 8.sp,
//                                     backgroundColor: primaryColor,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(20.r))),
//                                 child: Text(
//                                   'Save',
//                                   style: GoogleFonts.quicksand(
//                                       fontSize: 16.sp,
//                                       fontWeight: FontWeight.w500,
//                                       color: whiteColor),
//                                 ),
//                               ))
//                         ],
//                       )
//                     ],
//                   );
//                 }),
//               ),
//             )));
//   }
// }
