import 'package:fakestore_api/api/endpoint_loader.dart';
import 'package:fakestore_api/feature/main_screen/domain/interfaces/categories_repository.dart';
import 'package:fakestore_api/model/categories/categories_v2_response.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final ApiService apiService;
  CategoriesRepositoryImpl({required this.apiService});

  @override
  Future<CategoriesV2Response> fetchCategoriesV2() {
    return apiService.fetchCategoriesV2();
  }

}