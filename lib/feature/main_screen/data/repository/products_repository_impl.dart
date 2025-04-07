import 'package:fakestore_api/api/endpoint_loader.dart';
import 'package:fakestore_api/feature/main_screen/domain/interfaces/products_repository.dart';
import 'package:fakestore_api/model/product.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final EndpointLoader apiService;
  ProductsRepositoryImpl({required this.apiService});

  @override
  Future<List<Product>> fetchMainProducts() async {
    return await apiService.fetchProducts();
  }

  @override
  Future<List<Product>> fetchMediumProducts() async {
    return await apiService.fetchProducts();
  }

  @override
  Future<List<Product>> fetchProductsInTrending() async {
    return await apiService.fetchProducts();
  }
}
