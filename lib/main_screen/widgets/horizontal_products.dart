import 'package:fakestore_api/main_screen/widgets/small_products.dart';
import 'package:flutter/material.dart';

import '../../model/product.dart';

class HorizontalProductsList extends StatelessWidget {
  final List<Product> list;

  const HorizontalProductsList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];
          return SmallProduct(product: item);
      }),
    );
  }

}