import 'package:fakestore_api/feature/bucket_screen/presentation/widgets/bucket_product.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:flutter/material.dart';

class BucketProducts extends StatelessWidget {
  final List<Product> products;
  const BucketProducts({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: products.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
         return BucketProduct(product: products[index],);
        },
      ),
    );
  }

}