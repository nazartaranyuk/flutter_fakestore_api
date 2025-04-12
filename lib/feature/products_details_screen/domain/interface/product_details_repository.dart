import 'package:fakestore_api/model/product.dart';

abstract class ProductDetailsRepository {

  Future<Product> fetchProduct(int id);
}