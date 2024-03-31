import 'package:flutter/foundation.dart';

import '../data/model/place_model.dart';

class AddressesViewModel extends ChangeNotifier {
  AddressesViewModel() {
    myAddresses = [];
  }

  List<PlaceModel> myAddresses = [];

  bool _isLoading = false;

  bool get getLoader => _isLoading;

  addNewAddress(PlaceModel placeModel) async {
    myAddresses.add(placeModel);
    notifyListeners();
    //Save some place
  }

  deleteAddress(){
    myAddresses =[];
  }}

