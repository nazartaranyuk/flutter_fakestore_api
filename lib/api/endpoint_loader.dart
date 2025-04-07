import 'dart:convert';

import 'package:fakestore_api/constants.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:http/http.dart' as http;

class EndpointLoader {
  static final String baseUrl = "https://fakestoreapi.com";

  Future<Product> fetchSingleProduct(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/products/$id"));

    if (response.statusCode == Constants.successCode) {
      final dynamic jsonData = jsonDecode(response.body);
      return Product.fromJson(jsonData);
    } else {
      throw Exception("Failed to fetch single product by this id: $id");
    }
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));
    if (response.statusCode == Constants.successCode) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load json data");
    }
  }
}
