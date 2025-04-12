import 'package:fakestore_api/core/api/api_service.dart';
import 'package:fakestore_api/model/product.dart';

import '../domain/interface/product_details_repository.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ApiService apiService;

  ProductDetailsRepositoryImpl({required this.apiService});

  @override
  Future<Product> fetchProduct(int id) {
    return apiService.fetchSingleProduct(id);
  }

}