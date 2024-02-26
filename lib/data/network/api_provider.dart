
import 'dart:convert';

import 'package:default_project/data/models/detail/hourly_item/one_call_data.dart';
import 'package:default_project/data/models/my_response.dart';
import 'package:default_project/data/models/simple/weather_main_model.dart';
import 'package:default_project/utils/constants/app_constants.dart';
import 'package:http/http.dart'as http;

class ApiProvider {
  static Future<MyResponse> getSimpleWeatherInfo(String city) async {
    Map<String, String> queryParams = {
      "appid": AppConstants.apiKey,
      "q": city,
    };

    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/2.5/weather",
      queryParams,
    );
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return MyResponse(
            data: WeatherMainModel.fromJson(jsonDecode(response.body)));
      } else {
        return MyResponse(errorText: "OTHER ERROR:${response.statusCode}");
      }
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }

  static Future<MyResponse> getComplexWeatherInfo() async {
    Map<String, String> queryParams = {
      "lat": "41.2646",
      "lon": "69.2163",
      "units": "metric",
      "exclude": "minutely,current",
      "appid": AppConstants.complexApiKey2,
    };
    Uri uri = Uri.https(
      AppConstants.baseUrl,
      "/data/2.5/onecall",
      queryParams,
    );

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return MyResponse(
            data: OneCallData.fromJson(jsonDecode(response.body)));
      } else {
        return MyResponse(errorText: "OTHER ERROR:${response.statusCode}");
      }
    } catch (error) {
      return MyResponse(errorText: error.toString());
    }
  }
}