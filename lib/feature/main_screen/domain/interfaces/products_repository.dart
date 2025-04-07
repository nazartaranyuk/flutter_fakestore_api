import 'package:fakestore_api/model/product.dart';

abstract class ProductsRepository {

  Future<List<Product>> fetchMainProducts();
  Future<List<Product>> fetchProductsInTrending();
  Future<List<Product>> fetchMediumProducts();
}