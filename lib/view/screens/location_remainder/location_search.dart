
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:talk_task/view/common_widgets/custom_text.dart';
import '../../../utilis/app_colors.dart';
import '../../../utilis/app_constants.dart';
import '../../../utilis/app_text_styles.dart';
import '../../../view_model/location_suggestion_provider.dart';
import '../../common_widgets/custom_app_bars.dart';

class AddressSuggestionScreen extends StatefulWidget{
  const AddressSuggestionScreen({super.key});

  @override
  State<AddressSuggestionScreen> createState() => _AddressSuggestionScreenState();
}

class _AddressSuggestionScreenState extends State<AddressSuggestionScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((a){
      context.read<LocationSuggestionProvider>().fetchLocationSuggestions('Pakistan');
    });
  }

  @override
  Widget build(BuildContext context) {
     const CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(31.582045, 74.329376),
      zoom: 16,
    );

    return Scaffold(
      appBar: AppBars.settingsAppBar(context: context, title: AppConstants.selectLocation),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
          child: Column(children: [
            _searchField()
          ],),
        ),
      ),
    );
  }

  Widget _searchField(){
    return  TextField(
      style: AppTextStyles.poppins(color: AppColors.black, fontSize: 16.sp, weight: FontWeight.w500),
      onChanged: (a){
        context.read<LocationSuggestionProvider>().fetchLocationSuggestions(a.toString());
      },
        decoration: InputDecoration(
         filled: true,
          fillColor: AppColors.whiteFFFFF,
          prefixIcon: Icon(Icons.search,size: 30.h,color: AppColors.greyLight.withOpacity(0.5),),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: AppColors.transparent)

          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: const BorderSide(color: AppColors.transparent)

          ),

        ),
    );
  }


  Widget _displayCard({required String address}){
    return Text(address,style: AppTextStyles.poppins(color: AppColors.black, fontSize: 16.sp,
      weight: FontWeight.w500,),maxLines: 2,overflow: TextOverflow.ellipsis,);
  }
}



