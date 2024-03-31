import 'package:default_project/screens/save_location_screen/location-screen.dart';
import 'package:default_project/screens/widgets/dialogs/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/model/place_category.dart';
import '../../../data/model/place_model.dart';

addressDetailDialog({
  required BuildContext context,
  required ValueChanged<PlaceModel> placeModel,
}) {
  final TextEditingController adressController = TextEditingController();
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController homeController = TextEditingController();
  final TextEditingController orientController = TextEditingController();

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const  SizedBox(height: 20,),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child:   Text(
                  "Add Adress",
                  style:TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w700),),
              ),
              const Padding(
                padding:  EdgeInsets.only(left: 8,),
                child:   Text(
                  "Now Address",
                  style:TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w700),),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5),
                child: TextField(
                  controller: orientController,
                  inputFormatters: [

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5),
                child: Row(
                  children: [
                    Expanded(child: NumberField(controller: entranceController, text: 'Entrance',)),
                    Expanded(child: NumberField(controller: floorController, text: 'Floor',)),
                    Expanded(child: NumberField(controller: homeController, text: 'Home',)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 5),
                child: TextField(
                  controller: adressController,
                  decoration: InputDecoration(
                  hintText: "Yaqinroq joy"
                  ),
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      placeModel.call(
                        PlaceModel(
                          entrance: "",
                          flatNumber: "",
                          orientAddress: "",
                          placeCategory: PlaceCategory.home,
                          latLng: const LatLng(0, 0),
                          placeName: "Chilonzor",
                          stage: "",
                        ),
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const  SaveLocationScreen()));
                    },
                    child: const  Text("SAVE"),),
              ),

            ],
          ),
        );
      });
}
