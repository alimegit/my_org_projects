import 'dart:math' show cos, sqrt, asin;
import 'package:default_project/data/models/user_place_model.dart';
import 'package:default_project/screens/toast.dart';
import 'package:default_project/utils/appcolors.dart';
import 'package:default_project/view_models/location_view_model.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}


class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  double lat = 0;
  double long = 0;
  // UserPlace userPlace = UserPlace(latLng: LatLng(lat, long ));
  @override
  void initState() {
    // context.read<MapsViewModel>().;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationViewModel>(
        builder: (context, locationViewModel, child) {
          LatLng? latLng = locationViewModel.latLng;
          double? latitude = latLng?.latitude;
          double? longitude = latLng?.longitude;
          debugPrint("LONGTITUDE$longitude");
          debugPrint("LONGTITUDE$latitude");
          if (latitude != null && longitude != null) {
            _calculateDistance(latitude, longitude, 21.423423423423423,
                12.23558444636441);
            return Stack(
              children: [
                context.watch<MapsViewModel>().loading
                    ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitude),
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('MyLocation'),
                  position: LatLng(latitude, longitude),
                ),
              },
            )
                    : GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(latitude, longitude),
                          zoom: 15,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId('MyLocation'),
                            position: LatLng(latitude, longitude),
                          ),
                        },
                      ),
                Positioned(
                  top: 800,
                  left: 15,
                  right: 15,
                  child: InkWell(
                    onTap: () {
                      double distance = _calculateDistance(
                        latitude,
                        longitude,
                        21.423423423423423,
                        12.23558444636441,
                      );
                      showSnackbar(context, 'Distance: ${distance} km');
                      debugPrint("-----DISTANCE $distance");
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.c_2A3256,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Distance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100, left: 300),
        child: FloatingActionButton(

          onPressed: () {
            debugPrint("ejiojd");
          },
          child: const Icon(Icons.gps_fixed),
        ),
      ),
    );
  }

  double _calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const p = 0.017453292519943295;
    const c = cos;
    final a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
