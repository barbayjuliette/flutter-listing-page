import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_listing_grid_view.dart';
import '../../business/cubit/product_listing_cubit.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  @override
  initState() {
    super.initState();
    context.read<ProductListingCubit>().loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organics e-store'),
      ),
      body: BlocBuilder<ProductListingCubit, ProductListingState>(
        builder: (context, state) {
          if (state is ProductListingLoaded) {
            return ProductListingGridView(
              products: state.products,
            );
          }
          else if (state is ProductListingFailure) {
            return const Center(
              child: Text('Oops, something went wrong. Please, try again.'),
            );
          }
          else {
            return const Center(
              child: Text('Loading ...'),
            );
          }
        },
      ),
    );
  }
}
