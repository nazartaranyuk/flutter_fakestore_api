import 'package:fakestore_api/feature/main_screen/presentation/widgets/horizontal_products.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/subtitle_widget.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:fakestore_api/core/utils/utils.dart';
import 'package:flutter/material.dart';

class MainProducts extends StatelessWidget {
  const MainProducts({
    super.key,
    required this.subtitle,
    required this.list,
    required this.onProductClicked,
    required this.onAddToBucketClicked,
  });

  final ValueSetter<int> onProductClicked;
  final ValueSetter<Pair<int, int>> onAddToBucketClicked;
  final String subtitle;
  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 16, bottom: 16),
          child: SubtitleWidget(subtitle: subtitle)
        ),
        HorizontalProductsList(
          list: list,
          onProductClicked: onProductClicked,
          onAddToBucketClicked: onAddToBucketClicked,
        ),
      ],
    );
  }
}