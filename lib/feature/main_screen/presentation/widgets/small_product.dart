import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore_api/colors.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 5),
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
                          child: CircularProgressIndicator(),
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
              style: GoogleFonts.roboto(
                color: ProjectColors.bgSecondary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              "${product.description}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(color: Colors.black, fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              "\$${product.price}.00",
              style: GoogleFonts.roboto(
                color: ProjectColors.bgSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                onAddToBucketClicked();
              },
              child: AddToBucketButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToBucketButton extends StatelessWidget {
  const AddToBucketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: ProjectColors.bgButton,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add to bucket",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                SvgPicture.asset("assets/cart_icon.svg", color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
