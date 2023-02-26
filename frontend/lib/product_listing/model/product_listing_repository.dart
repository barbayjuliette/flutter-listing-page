import 'dart:convert';
import 'package:http/http.dart' as http;

import './product.dart';

class ProductListingRepository {
  Future<List<Product>> fetchProducts() async {
    final url = Uri.http('localhost:3000', '');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      return list.map((json) => Product.fromJson(json)).toList();
    }
    else {
      throw Error();
    }
  }
}
