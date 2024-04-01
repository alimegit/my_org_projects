import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/screens/save_location_screen/save_location-screen.dart';
import 'package:default_project/screens/widgets/dialogs/textfield.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:default_project/view_models/place_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../data/model/place_category_enum.dart';
import '../../../data/model/place_model.dart';

addressDetailDialog({
  required String image,
  required BuildContext context,
  required String place,
  required ValueChanged<PlaceModel> placeModel,
}) {
  final TextEditingController addressController =
      place.isEmpty ? TextEditingController() : TextEditingController(text: place);
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController homeController = TextEditingController();
  final TextEditingController orientController = TextEditingController();

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Consumer<MapsViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Add Adress",
                      style:
                          TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                    ),
                    child: Text(
                      "Now Address",
                      style:
                          TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      controller: addressController,
                      // onChanged: (v) {
                      //   viewModel.currentPlaceName =v ;
                      // },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: NumberField(
                          controller: entranceController,
                          text: 'Entrance',
                        )),
                        Expanded(
                            child: NumberField(
                          controller: floorController,
                          text: 'Floor',
                        )),
                        Expanded(
                            child: NumberField(
                          controller: homeController,
                          text: 'Home',
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      controller: orientController,
                      decoration: const InputDecoration(hintText: "Yaqinroq joy"),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        if (entranceController.text.isEmpty &&
                            floorController.text.isEmpty &&
                            orientController.text.isEmpty &&
                            addressController.text.isEmpty) {
                          return;
                        } else {
                          context.read<PlaceViewModel>().insertPlaces(
                              PlaceModel(
                                id: "",
                                entrance: entranceController.text,
                                flatNumber: floorController.text,
                                orientAddress: orientController.text,
                                placeCategory: PlaceCategory.work,
                                latLng: const LatLng(0, 0),
                                placeName: orientController.text,
                                stage: "",
                                image: image,
                              ),
                              context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SaveLocationScreen(),
                            ),
                          );
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Ma\'lumotlar saqlandi!'),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 30.h,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: Text("SAVE")),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
}
