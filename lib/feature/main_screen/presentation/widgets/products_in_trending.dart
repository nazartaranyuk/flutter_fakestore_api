import 'package:fakestore_api/feature/main_screen/presentation/widgets/medium_horizontal_products.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/subtitle_widget.dart';
import 'package:fakestore_api/model/product_v2.dart';
import 'package:flutter/material.dart';

class ProductsInTrendsBlock extends StatelessWidget {
  const ProductsInTrendsBlock({
    super.key,
    required this.subtitle,
    required this.list,
  });

  final String subtitle;
  final List<ProductV2> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5, right: 5, top: 16, bottom: 16),
          child: SubtitleWidget(subtitle: subtitle)
        ),
        MediumHorizontalProducts(list: list),
      ],
    );
  }
}