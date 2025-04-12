import 'package:fakestore_api/core/db/bucket_repository.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:flutter/material.dart';

class BucketScreenViewModel extends ChangeNotifier {
  final BucketRepository repository;
  BucketScreenViewModel({required this.repository}) {
    getAllProducts();
  }

  List<Product> _products = []; 
  List<Product> get products => _products; 

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final ValueNotifier<List<Product>> _itemsNotifier = ValueNotifier([]);
  ValueNotifier<List<Product>> get itemsNotifier => _itemsNotifier;

  Future<void> getAllProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await repository.getAllProducts();
    } catch (e) {
      _products = [];
    }
    _isLoading = false;
    notifyListeners();
  }
}