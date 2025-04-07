import 'dart:convert';

import 'package:fakestore_api/constants.dart';
import 'package:fakestore_api/model/product.dart';
import 'package:fakestore_api/model/products_v2_response.dart';
import 'package:http/http.dart' as http;

class EndpointLoader {
  static final String baseUrl = "https://fakestoreapi.com";
  static final String baseUrl2 = "https://fakestoreapi.in/api";

  Future<Product> fetchSingleProduct(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/products/$id"));

    if (response.statusCode == Constants.successCode) {
      final dynamic jsonData = jsonDecode(response.body);
      return Product.fromJson(jsonData);
    } else {
      throw Exception("Failed to fetch single product by this id: $id");
    }
  }

  Future<List<Product>> fetchProductsFromComApi() async {
    final response = await http.get(Uri.parse("$baseUrl/products"));
    if (response.statusCode == Constants.successCode) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load json data");
    }
  }

  Future<ProductsV2Response> fetchProductsFromInApi() async {
    final response = await http.get(Uri.parse("$baseUrl2/products"));
    if (response.statusCode == Constants.successCode) {
      final dynamic jsonData = jsonDecode(response.body);
      return ProductsV2Response.fromJson(jsonData);
    } else {
      throw Exception("Failed to load json data");
    }
  }
}
