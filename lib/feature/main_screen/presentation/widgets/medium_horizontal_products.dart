import 'package:fakestore_api/feature/main_screen/presentation/widgets/medium_product.dart';
import 'package:flutter/material.dart';

import '../../../../model/product.dart';

class MediumHorizontalProducts extends StatelessWidget {
  final List<Product> list;

  const MediumHorizontalProducts({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final product = list[index];
          return MediumProduct(product: product);
      }),
    );
  }

}