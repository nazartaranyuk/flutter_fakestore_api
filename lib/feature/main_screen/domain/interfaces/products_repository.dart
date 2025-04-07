import 'package:fakestore_api/model/product.dart';
import 'package:fakestore_api/model/products_v2_response.dart';

abstract class ProductsRepository {

  Future<List<Product>> fetchMainProducts();
  Future<ProductsV2Response> fetchProductsInTrending();
  Future<List<Product>> fetchMediumProducts();
}