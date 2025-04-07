import 'package:fakestore_api/api/endpoint_loader.dart';
import 'package:fakestore_api/feature/main_screen/data/repository/products_repository_impl.dart';
import 'package:fakestore_api/feature/main_screen/domain/use_cases/load_main_products_use_case.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  MainViewModel() {
    _loadMainProducts();
  }
  final loadMainProductsUseCase = LoadMainProductsUseCase(
    repository: ProductsRepositoryImpl(apiService: EndpointLoader()),
  );
  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isAddToBucketButtonLoading = false;
  bool get isAddToBucketButtonLoading => _isAddToBucketButtonLoading;

  void addToBucket(int productId, int index) {
    _isAddToBucketButtonLoading = true;
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
