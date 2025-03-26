import 'package:fakestore_api/api/endpoint_loader.dart';
import 'package:fakestore_api/colors.dart';
import 'package:fakestore_api/main_screen/widgets/horizontal_products.dart';
import 'package:fakestore_api/main_screen/widgets/medium_horizontal_products.dart';
import 'package:fakestore_api/main_screen/widgets/search_widget.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.bgPrimary,
      body: FutureBuilder<List<Product>>(
        future: EndpointLoader.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            final List<Product> list = snapshot.data ?? List.empty();
            final others = list.where((product) => product.price! < 20).toList();
            return Column(
              children: [
                SizedBox(height: 50),
                SearchWidget(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InnerHorizontalBlock(
                          list: others,
                          subtitle: "Main products",
                        ),
                        SizedBox(height: 16,),
                        InnerMediumHorizontalBlock(
                          list: list.sublist(10, 20),
                          subtitle: "Products in trending",
                        ),
                        SizedBox(height: 16,),
                        InnerHorizontalBlock(
                          list: list.sublist(20, 30),
                          subtitle: "See what we got",
                        ),
                        SizedBox(height: 100,)
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}

class InnerHorizontalBlock extends StatelessWidget {

  const InnerHorizontalBlock({
    super.key,
    required this.subtitle,
    required this.list,
  });

  final String subtitle;
  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            subtitle,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        HorizontalProductsList(list: list),
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
  final List<Product> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            subtitle,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        MediumHorizontalProducts(list: list),
      ],
    );
  }
}


