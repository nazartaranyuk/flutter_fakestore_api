import 'package:fakestore_api/model/product_v2.dart';

class ProductsV2Response {
  final String status;
  final String message;
  final List<ProductV2> products;

  ProductsV2Response({
    required this.status,
    required this.message,
    required this.products,
  });

  factory ProductsV2Response.fromJson(Map<String, dynamic> json) =>
      ProductsV2Response(
        status: json['status'],
        message: json['message'],
        products: List<ProductV2>.from(
          json['products'].map((item) => ProductV2.fromJson(item)),
        ),
      );
}
