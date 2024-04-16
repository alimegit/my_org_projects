
import 'package:get/get.dart';

import '../../data/api_provider.dart';
import '../../data/models/currency_model.dart';
import '../../data/models/network_response.dart';

class CurrencyController extends GetxController {
  RxBool isLoading = false.obs;
  RxString errorMessage = "".obs;

  var currencies = [].obs;

  Future<void> fetchCurrencies() async {
    isLoading.value = true;

    NetworkResponse networkResponse = await ApiProvider().getCurrencies();

    if (networkResponse.errorText.isEmpty) {
      currencies.value = networkResponse.data as List<CurrencyModel>;
    } else {
      errorMessage.value = networkResponse.errorText;
    }

    isLoading.value = false;
  }
}
