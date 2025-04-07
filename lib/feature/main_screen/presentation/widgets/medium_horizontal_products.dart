import 'package:fakestore_api/feature/main_screen/presentation/widgets/medium_product.dart';
import 'package:fakestore_api/model/product_v2.dart';
import 'package:flutter/material.dart';

class MediumHorizontalProducts extends StatelessWidget {
  final List<ProductV2> list;

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