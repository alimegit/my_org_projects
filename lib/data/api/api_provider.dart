import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/countries_model.dart';
import '../response/response.dart';
class ApiProvider {
  static Future<MyResponse> getCountry() async {
    MyResponse myResponse = MyResponse();

    try {
      http.Response response =
          await http.get(Uri.parse("https://all-countries.free.mockoapp.net/countries"));

      if (response.statusCode == HttpStatus.ok) {
        List<CountryModel> countries = (jsonDecode(response.body)["data"]["countries"] as List?)
                ?.map((value) => CountryModel.fromJson(value))
                .toList() ??
            [];
        countries.removeWhere((element) => element.name == "Israel");
        myResponse.data = countries;
      }
    } catch (error) {
      rethrow;
    }
    return myResponse;
  }
}
