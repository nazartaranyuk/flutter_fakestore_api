import 'package:fakestore_api/core/api/api_service.dart';
import 'package:fakestore_api/core/db/bucket_repository.dart';
import 'package:fakestore_api/core/db/bucket_repository_impl.dart';
import 'package:fakestore_api/core/db/database.dart';
import 'package:fakestore_api/feature/bucket_screen/presentation/bucket_screen_view_model.dart';
import 'package:fakestore_api/feature/main_screen/data/repository/categories_repository_impl.dart';
import 'package:fakestore_api/feature/main_screen/data/repository/products_repository_impl.dart';
import 'package:fakestore_api/feature/main_screen/domain/interfaces/categories_repository.dart';
import 'package:fakestore_api/feature/main_screen/domain/interfaces/products_repository.dart';
import 'package:fakestore_api/feature/main_screen/domain/use_cases/load_categories_use_case.dart';
import 'package:fakestore_api/feature/main_screen/domain/use_cases/load_main_products_use_case.dart';
import 'package:fakestore_api/feature/main_screen/domain/use_cases/load_products_in_trending_use_case.dart';
import 'package:fakestore_api/feature/main_screen/presentation/main_view_model.dart';
import 'package:fakestore_api/feature/products_details_screen/data/product_details_repository_impl.dart';
import 'package:fakestore_api/feature/products_details_screen/domain/interface/product_details_repository.dart';
import 'package:fakestore_api/feature/products_details_screen/domain/use_case/get_product_details_use_case.dart';
import 'package:fakestore_api/feature/products_details_screen/presentation/product_details_view_model.dart';
import 'package:get_it/get_it.dart';

class MainAppService {
  GetIt locator = GetIt.instance;

  void setupLocator() {
    locator.registerSingleton(ApiService());
    locator.registerSingleton<ProductDetailsRepository>(
      ProductDetailsRepositoryImpl(apiService: locator.get<ApiService>()),
    );
    // MainDatabase
    locator.registerSingleton<MainDatabase>(MainDatabase());
    // BucketRepository
    locator.registerSingleton<BucketRepository>(
      BucketRepositoryImpl(database: locator.get<MainDatabase>())
    );
    // GetProductDetailsUseCase
    locator.registerFactory(
      () => GetProductDetailsUseCase(
        repository: locator.get<ProductDetailsRepository>(),
      ),
    );
    // ProductDetailsViewModel
    locator.registerFactoryParam<ProductDetailsViewModel, int, void>((
      productId,
      _,
    ) {
      return ProductDetailsViewModel(
        getProductDetailsUseCase: locator.get<GetProductDetailsUseCase>(),
        id: productId,
      );
    });
    // ProductsRepository
    locator.registerFactory<ProductsRepository>(
      () => ProductsRepositoryImpl(apiService: locator.get<ApiService>()),
    );
    // CategoriesRepository
    locator.registerFactory<CategoriesRepository>(
      () => CategoriesRepositoryImpl(apiService: locator.get<ApiService>()),
    );
    // LoadMainProductsUseCase
    locator.registerFactory<LoadMainProductsUseCase>(
      () => LoadMainProductsUseCase(
        repository: locator.get<ProductsRepository>(),
      ),
    );
    // LoadProductsInTrendingUseCase
    locator.registerFactory<LoadProductsInTrendingUseCase>(
      () => LoadProductsInTrendingUseCase(
        repository: locator.get<ProductsRepository>(),
      ),
    );
    // LoadCategoriesUseCase
    locator.registerFactory<LoadCategoriesUseCase>(
      () => LoadCategoriesUseCase(
        repository: locator.get<CategoriesRepository>(),
      ),
    );
    // MainViewModel
    locator.registerFactory<MainViewModel>(
      () => MainViewModel(
        bucketRepository: locator.get<BucketRepository>(),
        loadCategoriesUseCase: locator.get<LoadCategoriesUseCase>(),
        loadMainProductsUseCase: locator.get<LoadMainProductsUseCase>(),
        loadProductsInTrendingUseCase:
            locator.get<LoadProductsInTrendingUseCase>(),
      ),
    );
    // BucketScreenViewModel
    locator.registerFactory<BucketScreenViewModel>(
      () => BucketScreenViewModel(repository: locator.get<BucketRepository>())
    );
  }
}
