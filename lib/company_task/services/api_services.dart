import 'dart:convert';

import 'package:ecommerce/company_task/models/product.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
