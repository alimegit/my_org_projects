import "dart:convert";

import 'package:default_project/data/network/network_response.dart';
import "package:default_project/data/models/smart_model.dart";
import "package:http/http.dart" as http;

import "models/all_products_modul.dart";
import "models/input_categories_models.dart";

class ApiProvider {
  static Future<NetworkResponse> fetchSingleProductData(int id) async {
    NetworkResponse networkResponse = NetworkResponse();
    http.Response response;
    try {
      response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories/$id"));
      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => InputCategoriesModels.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Internal Error";
      }
    } catch (error) {
      networkResponse.errorText = "Error";
    }
    return networkResponse;
  }

  static Future<NetworkResponse> fetchProducts() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/categories"));
      if (response.statusCode == 200) {
        networkResponse.data = (jsonDecode(response.body) as List?)
                ?.map((e) => SmartModel.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Internal Error";
      }
    } catch (error) {
      networkResponse.errorText = "Error";
    }
    return networkResponse;
  }
  static Future allProducts() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      http.Response response = await http
          .get(Uri.parse("https://imtixon.free.mockoapp.net/products"));
      if (response.statusCode == 200) {
        List<AllProductModel> allProducts =
            (jsonDecode(response.body)["data"] as List?)
                ?.map((e) => AllProductModel.fromJson(e))
                .toList() ??
                [];
        return networkResponse.data = allProducts;
      } else {
        return networkResponse.errorText = "ERROR";
      }
    } catch (error) {
      return networkResponse.errorText = error.toString();
    }
  }
}
