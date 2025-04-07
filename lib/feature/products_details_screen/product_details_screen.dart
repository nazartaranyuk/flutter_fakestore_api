import 'package:fakestore_api/api/endpoint_loader.dart';
import 'package:fakestore_api/colors.dart';
import 'package:fakestore_api/constants.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/small_product.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:fakestore_api/feature/products_details_screen/product_details_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;
  const ProductDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product details screen")),
      body: FutureBuilder(
        future: EndpointLoader().fetchSingleProduct(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            final product = snapshot.data;
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ProductImage(product: product),
                          ProductTitle(product: product),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 201, 201, 201),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(product?.category ?? "Category"),
                              ),
                            ),
                          ),
                          ProductDescription(product: product),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: BigAddToBucketButton(onAddToBucketClicked: () {}),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 350,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(image: NetworkImage(product!.image!)),
        ),
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: SizedBox(
            width: 250,
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              "${product?.title}",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
              child: Text(
                "\$${product?.price}.00",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.product});

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
      child: Text(
        overflow: TextOverflow.ellipsis,
        maxLines: 4,
        product?.description ?? Constants.emptyString,
        style: GoogleFonts.roboto(fontSize: 14),
      ),
    );
  }
}

class BigAddToBucketButton extends StatelessWidget {
  final VoidCallback onAddToBucketClicked;

  const BigAddToBucketButton({super.key, required this.onAddToBucketClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {},
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 50,
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
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
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
