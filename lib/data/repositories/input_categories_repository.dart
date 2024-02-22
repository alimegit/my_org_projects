import 'package:default_project/data/api.provider.dart';

import '../network/network_response.dart';

class InputCategoriesRepository {
  Future<NetworkResponse> getInputCategories(int id) async =>
      ApiProvider.fetchSingleProductData(id);
}
