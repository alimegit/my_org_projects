

import '../api.provider.dart';
import '../network/network_response.dart';

class ALLProductRepository {
  Future getProducts() async =>
      await ApiProvider.allProducts();
}