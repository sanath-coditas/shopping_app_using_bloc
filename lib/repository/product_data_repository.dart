import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_app_assignment/models/product.dart';

class ProductDataRepository {
  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse('https://fakestoreapi.com/products/');
    try {
      http.Response response = await http.get(url);
      return List<Product>.from(json.decode(response.body).map((item) {
        return Product.fromJson(item);
      }));
    } catch (e) {
      // print(e.toString());
      rethrow;
    }
  }
}
