import 'package:default_project/screens/widgets/category_widget.dart';
import 'package:default_project/screens/widgets/dialogs/dialog.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:default_project/screens/widgets/map_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../data/model/place_category.dart';
import '../data/model/place_model.dart';
import '../view_models/adress_view_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    return Scaffold(
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
          return Stack(
            children: [
              GoogleMap(
                markers: viewModel.markers,
                onCameraIdle: () {
                  if (cameraPosition != null) {
                    context.read<MapsViewModel>().changeCurrentLocation(cameraPosition!);
                  }
                },
                onCameraMove: (CameraPosition currentCameraPosition) {
                  cameraPosition = currentCameraPosition;
                  debugPrint("CURRENT POSITION:${currentCameraPosition.target.longitude}");
                },
                mapType: viewModel.mapType,
                initialCameraPosition: viewModel.initialCameraPosition!,
                onMapCreated: (GoogleMapController createdController) {
                  viewModel.controller.complete(createdController);
                },
              ),
              Align(
                child: Image.asset(
                  AppImages.userLocation,
                  width: 50,
                  height: 50,
                ),
              ),
              Positioned(
                top: 100.h,
                right: 0,
                left: 0,
                child: Text(
                  viewModel.currentPlaceName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 650, left: 10.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryButton(
                        title: " Ish",
                        imgPath: AppImages.work,
                        voidCallback: () {
                          activeIndex = 1;
                          setState(() {});
                        },
                        activeIndex: activeIndex == 1),
                    CategoryButton(
                        title: " Home",
                        imgPath: AppImages.work,
                        voidCallback: () {
                          activeIndex = 2;
                          setState(() {});
                        },
                        activeIndex: activeIndex == 2),
                    CategoryButton(
                        title: "other",
                        imgPath: AppImages.work,
                        voidCallback: () {
                          activeIndex = 3;
                          setState(() {});
                        },
                        activeIndex: activeIndex == 3),
                  ],
                ),
              )
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 330, bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<MapsViewModel>().moveToInitialPosition();
              },
              child: const Icon(Icons.gps_fixed),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () {
                addressDetailDialog(
                  context: context,
                  placeModel: (newAddressDetails) {
                    PlaceModel place = newAddressDetails;
                    place.latLng = cameraPosition!.target;
                    place.placeCategory = PlaceCategory.work;
                    context.read<AddressesViewModel>().addNewAddress(place);
                    Navigator.pop(context);
                  },
                );
              },
              child: const Icon(Icons.add_home_work_outlined),
            ),
            const SizedBox(height: 20),
            const MapTypeItem(),
          ],
        ),
      ),
    );
  }

  _showMapTypePopup() {
    // show
  }
}
