import 'package:default_project/services/local_notification_services.dart';
import 'package:default_project/utils/app_images.dart';
import 'package:default_project/view_models/maps_view_model.dart';
import 'package:default_project/view_models/notification_view_model.dart';
import 'package:default_project/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_picker/map_picker.dart';
import 'package:provider/provider.dart';

import 'data/model/notif_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  int id = 1;

  _init() async {
    // FirebaseMessaging.instance.subscribeToTopic("news");
    // FirebaseMessaging.instance.subscribeToTopic("news");
    // String? fcmToken = await FirebaseMessaging.instance.getToken();
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      debugPrint("Push notification keldiku☺ => ${remoteMessage.notification!.title}");
      if (remoteMessage.notification != null) {
        LocalNotificationService().showNotification(
            title: remoteMessage.notification!.title!,
            body: remoteMessage.notification!.body!,
            id: id);
      }
    });
  }
  @override
  void initState() {
_init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    CameraPosition? cameraPosition;
    MapPickerController mapPickerController = MapPickerController();
    return Scaffold(
      body: Consumer<MapsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.initialCameraPosition == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              MapPicker(
                iconWidget:  Align(
                  child: IconButton(
                    onPressed: (){
                      LocalNotificationService.localNotificationService.showNotification(
                        title: "Qo'shildi",
                        body: "Maxsulot qo'shildi.",
                        id: id,
                      );
                      context.read<NotificationViewModel>()
                          .addMessage(messageModel: NotificationModel(name: "Qo'shildi", id: id));
                      id++;

                    },
                    icon: Image.asset(
                      AppImages.userLocation,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                mapPickerController: mapPickerController,
                child: GoogleMap(
                  markers: viewModel.markers,
                  onCameraIdle: () {
                    if (cameraPosition != null) {
                      context.read<MapsViewModel>().changeCurrentLocation(cameraPosition!);
                      context.read<MapsViewModel>().addNewMarker();
                    }
                  },
                  onCameraMove: (CameraPosition currentCameraPosition) {
                    cameraPosition == currentCameraPosition;
                    debugPrint("CURRENT POSITION:${currentCameraPosition.target.longitude}");
                  },
                  mapType: viewModel.mapType,
                  initialCameraPosition: viewModel.initialCameraPosition!,
                  onMapCreated: (GoogleMapController createdController) {
                    viewModel.controller.complete(createdController);
                  },
                ),
              ),
              // Align(
              //   child: Image.asset(
              //     AppImages.userLocation,
              //     width: 30,
              //     height: 30,
              //   ),
              // )
            ],
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 330,bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<MapsViewModel>().moveToInitialPosition();
              },
              child: const Icon(Icons.gps_fixed),
            ),
           SizedBox(height:20),
            const MapTypeItem(),
          ],
        ),
      ),
    );
  }

}
