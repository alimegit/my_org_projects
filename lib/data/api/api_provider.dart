import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../model/data_model.dart';
import '../network/my_response.dart';

class ApiProvider {
  static Future<MyResponse> getAllData() async {
    MyResponse myResponse = MyResponse();

    try {
      http.Response response = await http.get(Uri.parse(
          "https://banking-api.free.mockoapp.net/transactions-incomes"));

      if (response.statusCode == HttpStatus.ok) {
        // debugPrint("Data: ${response.body}");
        List<List<DataModel>> data = (jsonDecode(response.body) as List?)
            ?.map((el) =>
        (el["data"] as List?)
            ?.map((e) => DataModel.fromJson(e))
            .toList() ??
            [])
            .toList() ??
            [];
        List<DataModel> ban = [];
        for (var element in data) {
          ban.addAll(element);
        }
        myResponse.data = ban;
      }
    } catch (_) {
      myResponse.errorText = "404";
    }

    return myResponse;
  }
}