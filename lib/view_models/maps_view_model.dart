
import 'dart:async';
import 'dart:ui' as ui;
import 'package:default_project/data/models/user_place_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../data/api/api_provider.dart';


class MapsViewModel extends ChangeNotifier {
  MapsViewModel() {
    getUserLocation();
  }

  String currentPlaceName = "";

  bool _loading = false;

  bool get loading => _loading;

  final Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();

  MapType mapType = MapType.normal;

  late CameraPosition initialCameraPosition;
  late CameraPosition currentCameraPosition;
  Set<Marker> markers = {};

  List<UserPlace> userAddress = [];

  setLatInitialLong(LatLng latLng) {
    _myNotifyListeners(true);
    initialCameraPosition = CameraPosition(
      target: latLng,
      zoom: 15,
    );
    _myNotifyListeners(false);

  }

  changeMapType(MapType newMapType) {
    mapType = newMapType;
    notifyListeners();
  }

  moveToInitialPosition() async {
    final GoogleMapController mapController = await controller.future;
    await mapController
        .animateCamera(CameraUpdate.newCameraPosition(initialCameraPosition!));
  }

  changeCurrentCameraPosition(CameraPosition cameraPosition) async {
    final GoogleMapController mapController = await controller.future;
    await mapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  // changeCurrentLocation(CameraPosition cameraPosition) async {
  //   currentCameraPosition = cameraPosition;
  //   currentPlaceName =
  //   await ApiProvider.getPlaceNameByLocation(cameraPosition.target);
  //   notifyListeners();
  // }

  addNewMarker(UserPlace userPlace) async {
    markers = {};

    markers.add(
      Marker(
        position: userPlace.latLng,
        infoWindow: InfoWindow(
          title: userPlace.latLng.toString(),
          snippet: userPlace.latLng.toString(),
        ),
        //BitmapDescriptor.defaultMarker,
        icon: BitmapDescriptor.fromBytes(userPlace.latLng as Uint8List),
        markerId: MarkerId(DateTime.now().toString()),
      ),
    );
    notifyListeners();
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // savePlace(PlaceModel placeModel) {
  //   userAddress.add(placeModel);
  //   addNewMarker(placeModel);
  // }

  Future<void> getUserLocation() async {
    Location location = Location();
    bool serviceEnabled = false;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    setLatInitialLong(LatLng(locationData.latitude!, locationData.longitude!));
    debugPrint("LONGITUDE:${locationData.longitude}");
    debugPrint("LATITUDE:${locationData.latitude}");
    debugPrint("SPEED:${locationData.speed}");
    debugPrint("ALTITUDE:${locationData.altitude}");

    //listenCurrentLocation();

    //location.enableBackgroundMode(enable: true);
  }

  _myNotifyListeners(bool value){
    _loading = true;
    notifyListeners();
  }
}
