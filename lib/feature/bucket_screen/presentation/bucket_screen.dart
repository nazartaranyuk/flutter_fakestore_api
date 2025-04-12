import 'package:fakestore_api/core/utils/base_text.dart';
import 'package:fakestore_api/core/widgets/loader.dart';
import 'package:fakestore_api/feature/bucket_screen/presentation/bucket_screen_view_model.dart';
import 'package:fakestore_api/feature/bucket_screen/presentation/widgets/bucket_products.dart';
import 'package:fakestore_api/feature/bucket_screen/presentation/widgets/bucket_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BucketScreen extends StatelessWidget {
  const BucketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BucketScreenViewModel viewModel = Provider.of<BucketScreenViewModel>(
      context,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: BaseText(text: "Your bucket"),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body:
          viewModel.isLoading
              ? Loader()
              : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    BucketTitle(),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            BucketProducts(products: viewModel.products),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      child: Center(
                        child: BaseText(
                          text: "Proceed to checkout",
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).padding.bottom),
                  ],
                ),
              ),
    );
  }
}
