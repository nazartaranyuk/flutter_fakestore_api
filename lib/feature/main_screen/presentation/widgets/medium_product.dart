import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore_api/core/utils/base_text.dart';
import 'package:fakestore_api/core/utils/colors.dart';
import 'package:fakestore_api/core/widgets/loader.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/add_to_bucket_button_state.dart';
import 'package:fakestore_api/model/product_v2.dart';
import 'package:flutter/material.dart';

import 'add_to_bucket_button.dart';

class MediumProduct extends StatelessWidget {
  final ProductV2 product;

  const MediumProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = product.image;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl ?? "",
                    width: 150,
                    height: 150,
                    imageBuilder:
                        (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(image: imageProvider),
                          ),
                        ),
                    placeholder:
                        (context, url) => Center(
                          child: SizedBox(width: 50, height: 50, child: Loader()),
                        ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ProjectColors.buttonColor,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                        child: Padding(padding: EdgeInsets.all(4), child: BaseText(text: "-${product.discount}%", color: ProjectColors.bgPrimary, fontWeight: FontWeight.bold,)),
                      ),
                      BaseText(text: product.title!, maxLines: 4, fontWeight: FontWeight.w600,),
                    ],
                  ),
                )
              ],
            ),
            AddToBucketButton(state: BucketInitial(),)
          ],
        ),
      ),
    );
  }
}
