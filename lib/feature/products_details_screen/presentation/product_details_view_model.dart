import 'package:fakestore_api/feature/products_details_screen/domain/use_case/get_product_details_use_case.dart';
import 'package:fakestore_api/feature/products_details_screen/presentation/state/product_screen_state.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  final GetProductDetailsUseCase getProductDetailsUseCase;
  final int id;
  ProductDetailsViewModel({required this.getProductDetailsUseCase, required this.id}) {
    loadProduct(id);
  }

  ProductScreenState _state = LoadingState();
  ProductScreenState get state => _state;


  Future<void> loadProduct(int id) async {
    _state = LoadingState();
    notifyListeners();

    try {
      final response = await getProductDetailsUseCase.execute(id);
      _state = SuccessState(product: response);
      notifyListeners();
    } catch (e) {
      _state = ErrorState(message: "Failed to load product}");
      notifyListeners();
    }
    getProductDetailsUseCase.execute(id);

  }
}