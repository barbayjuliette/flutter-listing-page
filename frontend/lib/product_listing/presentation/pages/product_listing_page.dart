import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

import '../widgets/product_listing_grid_view.dart';
import '../../model/product.dart';

class ProductListingPage extends StatelessWidget {
  const ProductListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organics e-store'),
      ),
      body: ProductListingGridView(products: _buildProductList(20)),
    );
  }

  List<Product> _buildProductList(int amount) {
    var products = <Product>[];

    for (var index = 0; index < amount; index++) {
      final product = Product(
        name: faker.food.dish(),
        description: faker.food.cuisine(),
        price: faker.randomGenerator.integer(50000),
        photo: 'https://picsum.photos/id/$index/200',
        stock: faker.randomGenerator.integer(500),
      );
      products.add(product);
    }

    return products;
  }
}
