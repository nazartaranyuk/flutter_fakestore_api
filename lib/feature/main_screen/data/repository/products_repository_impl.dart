import 'package:fakestore_api/core/api/api_service.dart';
import 'package:fakestore_api/feature/main_screen/domain/interfaces/products_repository.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:fakestore_api/model/products_v2_response.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ApiService apiService;
  ProductsRepositoryImpl({required this.apiService});

  @override
  Future<List<Product>> fetchMainProducts() async {
    return await apiService.fetchProductsFromComApi();
  }

  @override
  Future<List<Product>> fetchMediumProducts() async {
    return await apiService.fetchProductsFromComApi();
  }

  @override
  Future<ProductsV2Response> fetchProductsInTrending() async {
    return await apiService.fetchProductsFromInApi();
  }
}
