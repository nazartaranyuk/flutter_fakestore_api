import 'package:fakestore_api/feature/main_screen/domain/interfaces/products_repository.dart';
import 'package:fakestore_api/model/products_v2_response.dart';

class LoadProductsInTrendingUseCase {
  final ProductsRepository repository;
  LoadProductsInTrendingUseCase({required this.repository});

  Future<ProductsV2Response> execute() async {
    return await repository.fetchProductsInTrending();
  }
}