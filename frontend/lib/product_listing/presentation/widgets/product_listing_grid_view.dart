import 'package:flutter/material.dart';

import './product_listing_item.dart';
import '../../model/product.dart';

class ProductListingGridView extends StatelessWidget {
  final List<Product> products;

  const ProductListingGridView({
    super.key,
    required this.products,
  });

  int _crossAxisCount(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final int crossAxisCount;
    if (mediaQueryData.size.width > 1000) {
      crossAxisCount = 4;
    }
    else if (mediaQueryData.size.width > 750) {
      crossAxisCount = 3;
    }
    else if (mediaQueryData.size.width > 550) {
      crossAxisCount = 2;
    }
    else {
      crossAxisCount = 1;
    }
    return crossAxisCount;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(50),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _crossAxisCount(context),
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
      ),
      itemCount: products.length,
      itemBuilder: ((context, index) {
        return ProductListingItem(product: products[index]);
      }),
    );
  }
}
