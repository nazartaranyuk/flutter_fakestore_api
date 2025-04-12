import 'package:fakestore_api/feature/products_details_screen/domain/interface/product_details_repository.dart';
import 'package:fakestore_api/model/product.dart';

class GetProductDetailsUseCase {
  final ProductDetailsRepository repository;
  GetProductDetailsUseCase({required this.repository});

  Future<Product> execute(int id) {
    return repository.fetchProduct(id);
  }
}