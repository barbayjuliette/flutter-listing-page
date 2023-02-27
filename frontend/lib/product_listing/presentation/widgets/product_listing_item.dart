import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
                Expanded(
                  flex: 1,
                  child: AutoSizeText(
                    product.name,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.start,
                    wrapWords: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  flex: 0,
                  child: AutoSizeText(
                    product.formattedPrice,
                    style: Theme.of(context).textTheme.displayMedium,
                    textAlign: TextAlign.end,
                    wrapWords: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
