import 'package:cached_network_image/cached_network_image.dart';
import 'package:fakestore_api/colors.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:fakestore_api/model/product_v2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MediumProduct extends StatelessWidget {
  final ProductV2 product;

  const MediumProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = product.image;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
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
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  width: 250,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Text(
                        "${product.title}",
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          color: ProjectColors.bgPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
