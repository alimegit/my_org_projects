import 'package:default_project/utils/app_text_style.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:default_project/view_models/location_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late  CameraPosition? initialCameraPosition;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
   Future.microtask(()  {
   LatLng? latLng = context
       .read<LocationViewModel>()
       .latLng;
       initialCameraPosition = CameraPosition(target: latLng!, zoom: 15,
       );
       setState(() {

       });
   });
  }

  @override
  Widget build(BuildContext context) {
    context.read<LocationViewModel>().location;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.c_1A72DD,
          title: Text(
            "Google Map", style: AppTextStyle.robotoMedium.copyWith(color: Colors.black,fontSize: 15.sp),),
        ),
        backgroundColor: AppColors.c_C4C4C4,
        body: initialCameraPosition != null ? GoogleMap(
            initialCameraPosition: initialCameraPosition!):const Center(
          child: Text("Nimadur"),
        )
    );
  }
}
