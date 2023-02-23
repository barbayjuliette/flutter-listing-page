import 'package:flutter/material.dart';

import '../../model/product.dart';

class ProductListingItem extends StatelessWidget {
  final Product product;

  const ProductListingItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              product.photo,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Text(product.name),
                const Spacer(),
                Text('\$${product.formattedPrice}')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
