import 'package:fakestore_api/colors.dart';
import 'package:fakestore_api/feature/main_screen/presentation/main_view_model.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/horizontal_products.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/medium_horizontal_products.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/search_widget.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/subtitle_widget.dart';
import 'package:fakestore_api/feature/products_details_screen/product_details_screen.dart';
import 'package:fakestore_api/feature/search_screen/search_screen.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:fakestore_api/model/product_v2.dart';
import 'package:fakestore_api/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void onSearchClicked(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (builder) => SearchScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context);
    return Scaffold(
      backgroundColor: ProjectColors.bgPrimary,
      body:
          viewModel.isLoading
              ? const Loader()
              : Column(
                children: [
                  SizedBox(height: 30),
                  SearchWidget(
                    onSearchClicked: () {
                      onSearchClicked(context);
                    },
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InnerHorizontalBlock(
                            subtitle: "Main products",
                            list: viewModel.products,
                            onProductClicked:
                                (id) => {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              ProductDetailsScreen(id: id),
                                    ),
                                  ),
                                },
                            onAddToBucketClicked: (pair) {
                              viewModel.addToBucket(pair.first, pair.second);
                            },
                          ),
                          viewModel.isLoading
                              ? Loader()
                              : InnerMediumHorizontalBlock(
                                subtitle: "In trends",
                                list: viewModel.productsInTrending,
                              ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}

class InnerHorizontalBlock extends StatelessWidget {
  const InnerHorizontalBlock({
    super.key,
    required this.subtitle,
    required this.list,
    required this.onProductClicked,
    required this.onAddToBucketClicked,
  });

  final ValueSetter<int> onProductClicked;
  final ValueSetter<Pair<int, int>> onAddToBucketClicked;
  final String subtitle;
  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: SubtitleWidget(subtitle: subtitle)
        ),
        HorizontalProductsList(
          list: list,
          onProductClicked: onProductClicked,
          onAddToBucketClicked: onAddToBucketClicked,
        ),
      ],
    );
  }
}

class InnerMediumHorizontalBlock extends StatelessWidget {
  const InnerMediumHorizontalBlock({
    super.key,
    required this.subtitle,
    required this.list,
  });

  final String subtitle;
  final List<ProductV2> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: SubtitleWidget(subtitle: subtitle)
        ),
        MediumHorizontalProducts(list: list),
      ],
    );
  }
}
