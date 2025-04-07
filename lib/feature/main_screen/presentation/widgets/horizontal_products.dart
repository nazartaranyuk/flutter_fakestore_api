import 'package:fakestore_api/feature/main_screen/presentation/widgets/small_product.dart';
import 'package:fakestore_api/utils.dart';
import 'package:flutter/material.dart';

import '../../../../model/product.dart';

class HorizontalProductsList extends StatelessWidget {
  final List<Product> list;
  final ValueSetter<int> onProductClicked;
  final ValueSetter<Pair<int, int>> onAddToBucketClicked;

  const HorizontalProductsList({
    super.key,
    required this.list,
    required this.onProductClicked,
    required this.onAddToBucketClicked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final product = list[index];
          final pair = Pair(first: product.id ?? 0, second: index);
          return SmallProduct(
            product: product,
            onProductClicked: onProductClicked,
            onAddToBucketClicked: () => onAddToBucketClicked(pair),
          );
        },
      ),
    );
  }
}
