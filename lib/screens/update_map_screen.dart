import 'package:default_project/screens/widgets/category_button.dart';
import 'package:default_project/screens/widgets/dialogs/dialog.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:default_project/screens/widgets/map_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../data/model/place_category_enum.dart';
import '../data/model/place_model.dart';
import '../view_models/adress_view_model.dart';

class UpdateMapScreen extends StatefulWidget {
  const UpdateMapScreen({
    super.key,
  });

  @override
  State<UpdateMapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<UpdateMapScreen> {
  int activeIndex = 0;
  late String image;
  late String text;

  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    return Scaffold(
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
          text = viewModel.currentPlaceName;
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
              categoryButton(
                callIndex: (int value) {},
                imagePath: (String value) {
                  image = value;
                },
              ),
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
                  image: image,
                  place: text,
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
