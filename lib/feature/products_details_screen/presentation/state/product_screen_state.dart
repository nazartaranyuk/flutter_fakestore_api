import '../../../../model/product.dart';

sealed class ProductScreenState {
  const ProductScreenState();
}

class LoadingState extends ProductScreenState {}
class SuccessState extends ProductScreenState {
  final Product product;
  SuccessState({required this.product});
}
class ErrorState extends ProductScreenState {
  final String message;
  ErrorState({required this.message});
}