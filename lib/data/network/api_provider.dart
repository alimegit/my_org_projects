
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/currency_model.dart';
import '../model/network_response.dart';

class ApiProvider {
  static Future<NetworkResponse> getCurrencies() async {
    try {
      http.Response response = await http
          .get(Uri.parse("https://cbu.uz/uz/arkhiv-kursov-valyut/json/"));
      if (response.statusCode == HttpStatus.ok) {
        debugPrint("--------------${response.body}");
        return NetworkResponse(
          data: (jsonDecode(response.body) as List?)
              ?.map((e) => CurrencyModel.fromJson(e))
              .toList() ??
              [],
        );
      }
      return NetworkResponse(errorText: "Noma'lum xatolik");
    } on SocketException {
      return NetworkResponse(errorText: "Internet ulanmagan");
    } on FormatException {
      return NetworkResponse(errorText: "Format togri kelmadi");
    } catch (error) {
      return NetworkResponse(errorText: error.toString());
    }
  }
}
