import 'package:fakestore_api/core/utils/colors.dart';
import 'package:fakestore_api/core/utils/constants.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/search_widget.dart';
import 'package:fakestore_api/feature/products_details_screen/presentation/product_details_view_model.dart';
import 'package:fakestore_api/feature/products_details_screen/presentation/state/product_screen_state.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/loader.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int id;

  const ProductDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    ProductDetailsViewModel viewModel = Provider.of<ProductDetailsViewModel>(
      context,
    );

    Widget handleState(ProductScreenState state) {
      if (state is LoadingState) {
        return Center(child: Loader());
      } else if (state is SuccessState) {
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
                      ProductImage(product: state.product),
                      ProductTitle(product: state.product),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 201, 201, 201),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(state.product.category ?? "Category"),
                          ),
                        ),
                      ),
                      ProductDescription(product: state.product),
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
      } else {
        return Center();
      }
    }

    return Scaffold(
      backgroundColor: ProjectColors.bgPrimary,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(right: 16),
          child: SearchField(onSearchClicked: () {}),
        ),
        backgroundColor: Colors.white,
        titleSpacing: 0,
      ),
      body: SafeArea(child: handleState(viewModel.state)),
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
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              "${product?.title}",
              style: GoogleFonts.poppins(
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
                "\$${product?.price}",
                style: GoogleFonts.poppins(
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
        style: GoogleFonts.poppins(fontSize: 14),
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
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: ProjectColors.buttonColor,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add to bucket",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: ProjectColors.bgPrimary,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
