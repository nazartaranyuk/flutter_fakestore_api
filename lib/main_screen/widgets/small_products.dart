import 'package:fakestore_api/colors.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallProduct extends StatelessWidget {
  final Product product;

  const SmallProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = product.images?.first;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ProjectColors.bgSecondary,
                image: DecorationImage(image: NetworkImage(imageUrl ?? "")),
              ),
            ),
            Text(
              "${product.title}",
              maxLines: 2,
              style: TextStyle(color: ProjectColors.bgSecondary),
            ),
            SizedBox(height: 20),
            Container(
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
                      SizedBox(width: 5,),
                      SvgPicture.asset("assets/cart_icon.svg", color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
