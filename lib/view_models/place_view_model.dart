import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_project/utils/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../data/model/place_model.dart';

class PlaceViewModel extends ChangeNotifier {
  bool isLoading = false;

  bool get getLoader => isLoading;

  Stream<List<PlaceModel>> listenPlaces() =>
      FirebaseFirestore.instance.collection("places").snapshots().map(
            (event) => event.docs
                .map(
                  (doc) => PlaceModel.fromJson(
                    doc.data(),
                  ),
                )
                .toList(),
          );

  insertPlaces(PlaceModel placeModel, BuildContext context) async {
    try {
      notify(true);
      var cf = await FirebaseFirestore.instance.collection("places").add(placeModel.toJson());
      await FirebaseFirestore.instance.collection("places").doc(cf.id).update({"doc_id": cf.id});

      cf.id;
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(context: context, message: error.code);
    }
  }

  updatePlace(PlaceModel placeModel, BuildContext context) async {
    try {
      notify(true);
      await FirebaseFirestore.instance
          .collection("places")
          .doc(placeModel.id.toString())
          .update(placeModel.toJsonForUpdate());
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(context: context, message: error.code);
    }
  }

  deletePlace(String id, BuildContext context) async {
    try {
      notify(true);
      await FirebaseFirestore.instance.collection("places").doc(id).delete();
      notify(false);
    } on FirebaseException catch (error) {
      if (!context.mounted) return;
      showSnackbar(context: context, message: error.code);
    }
  }

  notify(bool v) {
    isLoading = v;
    notifyListeners();
  }
}
