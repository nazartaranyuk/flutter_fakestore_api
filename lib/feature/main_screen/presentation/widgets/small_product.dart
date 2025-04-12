import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore_api/core/utils/colors.dart';
import 'package:fakestore_api/core/widgets/loader.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/add_to_bucket_button_state.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';

import 'add_to_bucket_button.dart';

class SmallProduct extends StatelessWidget {
  final logger = Logger("SmallProduct");
  final Product product;
  final ValueSetter<int> onProductClicked;
  final VoidCallback onAddToBucketClicked;

  SmallProduct({
    super.key,
    required this.product,
    required this.onProductClicked,
    required this.onAddToBucketClicked,
  });

  @override
  Widget build(BuildContext context) {
    final String imageUrl = product.image ?? "";

    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (product.id != null) {
                  onProductClicked(product.id!);
                }
              },
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
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
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Loader(),
                        ),
                      ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              "${product.title}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: ProjectColors.bgSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              "${product.description}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(color: Colors.black, fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              "\$${product.price}",
              style: GoogleFonts.poppins(
                color: ProjectColors.bgSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                onAddToBucketClicked();
              },
              child: AddToBucketButton(state: product.buttonState ?? BucketInitial(),),
            ),
          ],
        ),
      ),
    );
  }
}
