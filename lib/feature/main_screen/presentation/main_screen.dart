import 'package:fakestore_api/core/utils/base_text.dart';
import 'package:fakestore_api/core/utils/colors.dart';
import 'package:fakestore_api/core/widgets/loader.dart';
import 'package:fakestore_api/feature/bucket_screen/presentation/bucket_screen.dart';
import 'package:fakestore_api/feature/bucket_screen/presentation/bucket_screen_view_model.dart';
import 'package:fakestore_api/feature/main_screen/presentation/main_view_model.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/add_to_bucket_button_state.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/categories_block.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/main_productrs_block.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/products_in_trending.dart';
import 'package:fakestore_api/feature/main_screen/presentation/widgets/search_widget.dart';
import 'package:fakestore_api/feature/products_details_screen/presentation/product_details_screen.dart';
import 'package:fakestore_api/feature/products_details_screen/presentation/product_details_view_model.dart';
import 'package:fakestore_api/feature/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void onSearchClicked(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (builder) => SearchScreen()));
  }

  static var locator = GetIt.instance;

  void navigateToDetails(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => ChangeNotifierProvider(
              child: ProductDetailsScreen(id: id),
              create: (_) => locator.get<ProductDetailsViewModel>(param1: id),
            ),
      ),
    );
  }

  void navigateToBucket(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (context) => ChangeNotifierProvider(
              create: (context) => locator.get<BucketScreenViewModel>(),
              child: BucketScreen(),
            ),
      ),
    );
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
                bottom: false,
                child: Column(
                  children: [
                    SearchWidget(
                      onBucketClicked: () => navigateToBucket(context),
                      bucketCount: viewModel.bucketCount,
                      onSearchClicked: () => onSearchClicked(context),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            BigBanner(),
                            MainProducts(
                              subtitle: "Main products",
                              list: viewModel.itemsNotifier,
                              onProductClicked:
                                  (id) => navigateToDetails(context, id),
                              onAddToBucketClicked: (pair) {
                                if (pair.first.buttonState is BucketSuccess) {
                                  navigateToBucket(context);
                                } else {
                                  viewModel.addToBucket(
                                    pair.first,
                                    pair.second,
                                  );
                                }
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
                            SizedBox(
                              height: MediaQuery.of(context).padding.bottom,
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

class BigBanner extends StatelessWidget {
  const BigBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                width: 150,
                child: BaseText(
                  text: "Best prices are waiting for you!",
                  maxLines: 2,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(child: Lottie.asset("assets/json/guy.json")),
        ],
      ),
    );
  }
}
