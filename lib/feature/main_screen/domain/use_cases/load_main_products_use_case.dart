import 'package:fakestore_api/feature/main_screen/domain/interfaces/products_repository.dart';
import 'package:fakestore_api/model/product.dart';

class LoadMainProductsUseCase {
  final ProductsRepository repository;
  LoadMainProductsUseCase({required this.repository});

  Future<List<Product>> execute() async {
    return await repository.fetchMainProducts();
  }
}
