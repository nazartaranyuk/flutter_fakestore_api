import 'package:fakestore_api/model/product.dart';
import 'package:flutter/widgets.dart';

abstract class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({super.key, required this.product});
}