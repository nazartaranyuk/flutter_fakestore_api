import 'dart:convert';

import 'package:fakestore_api/model/product.dart';
import 'package:http/http.dart' as http;

class EndpointLoader {

  static String baseUrl = "https://api.escuelajs.co/api/v1";
  static Uri allProductsUrl = Uri.parse("$baseUrl/products");

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(allProductsUrl);
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load json data");
    }
  }
}