

import 'package:default_project/data/models/my_response.dart';
import 'package:default_project/data/models/product_model.dart';
import 'package:default_project/data/network/api_provider.dart';

class ProductRepo {
  Future<MyResponse> getAllProducts() => ApiProvider.getAllProducts();

  Future<MyResponse> addProduct(ProductModel productModel) =>
      ApiProvider.addProducts(productModel);

  Future<MyResponse> deleteProduct(String productUUID) =>
      ApiProvider.deleteProduct(productUUID);

  Future<MyResponse> updateProduct(ProductModel productModel) =>
      ApiProvider.updateProduct(productModel);
}