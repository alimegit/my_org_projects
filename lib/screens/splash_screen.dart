import 'package:default_project/screens/map_screen.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:default_project/view_models/location_view_model.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<LocationViewModel>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Deafult"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            LatLng? latLng = context.read<LocationViewModel>().latLng;
            if (latLng != null) {
              Provider.of<MapsViewModel>(context, listen: false)
                  .setLatInitialLong(latLng);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MapScreen();
                  },
                ),
              );
            }
          },
          child: const Text("GOOGLE MAPS OYNASI"),
        ),
      ),
    );
  }
}