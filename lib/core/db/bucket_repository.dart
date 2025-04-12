import 'package:fakestore_api/model/product.dart';

abstract class BucketRepository {
  Future<void> saveProduct(Product product);
  Future<List<Product>> getAllProducts();
}