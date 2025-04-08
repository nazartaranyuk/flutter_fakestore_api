import 'package:fakestore_api/core/utils/base_text.dart';
import 'package:fakestore_api/core/utils/colors.dart';
import 'package:fakestore_api/core/widgets/loader.dart';
import 'package:fakestore_api/feature/main_screen/presentation/main_view_model.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/categories_block.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/main_productrs_block.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/products_in_trending.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/search_widget.dart';
import 'package:fakestore_api/feature/products_details_screen/product_details_screen.dart';
import 'package:fakestore_api/feature/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
      extendBodyBehindAppBar: true,
      backgroundColor: ProjectColors.bgPrimary,
      body:
          viewModel.isLoading
              ? const Loader()
              : SafeArea(
                child: Column(
                  children: [
                    SearchWidget(
                      onSearchClicked: () {
                        onSearchClicked(context);
                      },
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                              children: [
                                Column(children: [
                                  SizedBox(width: 150, child: BaseText(text: "Best prices are waiting for you!", maxLines: 2, fontSize: 18, fontWeight: FontWeight.bold,))
                                ],),
                                Expanded(child: Lottie.asset("assets/json/guy.json")),
                              ],
                            )),
                            MainProducts(
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
                                : ProductsInTrendsBlock(
                                  subtitle: "In trends",
                                  list: viewModel.productsInTrending,
                                ),
                            viewModel.isLoading
                                ? Loader()
                                : CategoriesBlock(
                                  categories: viewModel.categories,
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
