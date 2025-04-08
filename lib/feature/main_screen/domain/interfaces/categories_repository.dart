import 'package:fakestore_api/model/categories/categories_v2_response.dart';

abstract class CategoriesRepository {

  Future<CategoriesV2Response> fetchCategoriesV2();
}
