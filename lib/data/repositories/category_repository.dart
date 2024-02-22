import '../api.provider.dart';
import '../network/network_response.dart';

class CategoryRepository{
  Future<NetworkResponse> getAllCategory() =>
      ApiProvider.fetchProducts();
}