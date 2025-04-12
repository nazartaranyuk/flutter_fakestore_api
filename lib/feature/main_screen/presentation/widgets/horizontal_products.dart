import 'package:fakestore_api/feature/main_screen/presentation/widgets/small_product.dart';
import 'package:fakestore_api/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../model/product.dart';

class HorizontalProductsList extends StatelessWidget {
  final ValueNotifier<List<Product>> list;
  final ValueSetter<int> onProductClicked;
  final ValueSetter<Pair<Product, int>> onAddToBucketClicked;

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
      child: ValueListenableBuilder<List<Product>>(
        valueListenable: list,
        builder: (_, items, _) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8),
            itemCount: list.value.length,
            itemBuilder: (context, index) {
              final product = list.value[index];
              final pair = Pair(first: product, second: index);
              return SmallProduct(
                product: product,
                onProductClicked: onProductClicked,
                onAddToBucketClicked: () => onAddToBucketClicked(pair),
              );
            },
          );
        },
      ),
    );
  }
}
