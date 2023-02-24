import 'package:faker/faker.dart';

import './product.dart';

class ProductListingRepository {

  Future<List<Product>> fetchProducts() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _buildProductList(20);
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
