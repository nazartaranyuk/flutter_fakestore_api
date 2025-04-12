import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore_api/core/utils/base_text.dart';
import 'package:fakestore_api/core/utils/colors.dart';
import 'package:fakestore_api/core/widgets/loader.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BucketProduct extends StatelessWidget {
  final Product product;
  const BucketProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CachedNetworkImage(
                  imageUrl: product.image ?? "",
                  width: 100,
                  height: 100,
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
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: BaseText(text: "\$${product.price}"),
                ),
                Container(
                  width: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: ProjectColors.bgSearch),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BaseText(text: "1"),
                        Column(
                          children: [
                            SvgPicture.asset("assets/arrow_icon_up.svg"),
                            SizedBox(height: 5,),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.5),
                              child: SvgPicture.asset("assets/arrow_icon_down.svg"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(color: ProjectColors.bgSearch),
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
