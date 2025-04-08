import 'package:fakestore_api/feature/main_screen/domain/interfaces/categories_repository.dart';
import 'package:fakestore_api/model/categories/categories_v2_response.dart';

class LoadCategoriesUseCase {
  final CategoriesRepository repository;
  LoadCategoriesUseCase({required this.repository});

  Future<CategoriesV2Response> execute() {
    return repository.fetchCategoriesV2();
  }
}