import 'package:fakestore_api/api/endpoint_loader.dart';
import 'package:fakestore_api/feature/main_screen/data/repository/products_repository_impl.dart';
import 'package:fakestore_api/feature/main_screen/domain/use_cases/load_main_products_use_case.dart';
import 'package:fakestore_api/feature/main_screen/domain/use_cases/load_products_in_trending_use_case.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:fakestore_api/model/product_v2.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  MainViewModel() {
    _loadMainProducts();
    _loadProductsInTrending();
  }
  final loadMainProductsUseCase = LoadMainProductsUseCase(
    repository: ProductsRepositoryImpl(apiService: EndpointLoader()),
  );
  final loadProductsInTrendingUseCase = LoadProductsInTrendingUseCase(
    repository: ProductsRepositoryImpl(apiService: EndpointLoader()),
  );
  List<Product> _products = [];
  List<Product> get products => _products;

  List<ProductV2> _productsInTreding = [];
  List<ProductV2> get productsInTrending => _productsInTreding;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isAddToBucketButtonLoading = false;
  bool get isAddToBucketButtonLoading => _isAddToBucketButtonLoading;

  void addToBucket(int productId, int index) {
    _isAddToBucketButtonLoading = true;
    notifyListeners();
  }

  Future<void> _loadProductsInTrending() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await loadProductsInTrendingUseCase.execute();
      _productsInTreding = response.products;
    } catch (e) {
      _productsInTreding = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadMainProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await loadMainProductsUseCase.execute();
    } catch (e) {
      _products = [];
    }
    _isLoading = false;
    _products = _products.where((element) => element.price! < 50.0).toList();
    notifyListeners();
  }
}
