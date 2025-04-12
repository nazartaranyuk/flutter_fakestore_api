import 'package:fakestore_api/core/db/bucket_repository.dart';
import 'package:fakestore_api/feature/main_screen/domain/use_cases/load_categories_use_case.dart';
import 'package:fakestore_api/feature/main_screen/domain/use_cases/load_main_products_use_case.dart';
import 'package:fakestore_api/feature/main_screen/domain/use_cases/load_products_in_trending_use_case.dart';
import 'package:fakestore_api/feature/main_screen/presentation/util/category.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/add_to_bucket_button_state.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:fakestore_api/model/product_v2.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {

  final LoadCategoriesUseCase loadCategoriesUseCase;
  final LoadMainProductsUseCase loadMainProductsUseCase;
  final LoadProductsInTrendingUseCase loadProductsInTrendingUseCase;
  final BucketRepository bucketRepository;

  MainViewModel({
    required this.loadCategoriesUseCase,
    required this.loadMainProductsUseCase,
    required this.loadProductsInTrendingUseCase,
    required this.bucketRepository
  }) {
    _loadMainProducts();
    _loadProductsInTrending();
    _loadCategories();
    _getBucketCount();
  }

  List<Product> _products = [];
  ValueNotifier<List<Product>> _itemsNotifier = ValueNotifier([]);
  ValueNotifier<List<Product>> get itemsNotifier => _itemsNotifier;

  List<CategoryUI> _categories = [];
  List<CategoryUI> get categories => _categories;

  List<ProductV2> _productsInTreding = [];
  List<ProductV2> get productsInTrending => _productsInTreding;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _bucketCount = 0;
  int get bucketCount => _bucketCount;

  Future<void> _getBucketCount() async {
    try {
      var products = await bucketRepository.getAllProducts();
      _bucketCount = products.length;
    } catch (e) {
      _bucketCount = 0;
    }
    notifyListeners();
  }

  void addToBucket(Product product, int index) {
    _products[index] = _products[index].copyWith(state: BucketLoading());
    _itemsNotifier.value = _products;
    notifyListeners();
    Future.delayed(Duration(seconds: 1), () {
      _products[index] = _products[index].copyWith(state: BucketSuccess());
      _itemsNotifier.value = _products;
      bucketRepository.saveProduct(product);
      notifyListeners();
    });
  }

  List<CategoryUI> _mapCategories(List<String> categoriesFromApi) {
    List<String> supportedCategories = ["gaming", "audio", "mobile"];
    return categoriesFromApi
    .where((item) => supportedCategories.contains(item))
    .map((item) => CategoryUI(categoryName: item, assetPath: "assets/categories/category_${item}_icon.svg")).toList();
  }

  Future<void> _loadCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await loadCategoriesUseCase.execute();
      _categories = _mapCategories(response.categories ?? []);
    } catch (e) {
      _categories = [];
    }
    _isLoading = false;
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
    _itemsNotifier = ValueNotifier(_products);
    notifyListeners();
  }
}
