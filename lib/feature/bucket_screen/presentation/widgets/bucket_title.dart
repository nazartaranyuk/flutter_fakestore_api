import 'package:fakestore_api/core/utils/base_text.dart';
import 'package:flutter/material.dart';

class BucketTitle extends StatelessWidget {
  const BucketTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseText(text: "Product", fontWeight: FontWeight.w600,),
        BaseText(text: "Price", fontWeight: FontWeight.w600,),
        BaseText(text: "Quantity", fontWeight: FontWeight.w600,),
      ],
    );
  }
}
