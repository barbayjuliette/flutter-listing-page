import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_listing_grid_view.dart';
import '../../business/cubit/product_listing_cubit.dart';
import '../../model/product.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  @override
  initState() {
    super.initState();
    context.read<ProductListingCubit>().loadProducts(searchTerm: '');
  }

  Widget _buildRootWidget(BuildContext context, ProductListingState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 25, 50, 0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by name',
                border: OutlineInputBorder()
              ),
              autocorrect: false,
              enableSuggestions: false,
              onSubmitted: (searchTerm) {
                context.read<ProductListingCubit>().loadProducts(searchTerm: searchTerm);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: _childWidget(state),
        ),
      ],
    );
  }

  Widget _childWidget(ProductListingState state) {
    if (state is ProductListingLoaded) {
      return _loadedWidget(state.products);
    }
    else if (state is ProductListingFailure) {
      return _failureWidget;
    }
    else {
      return _loadingWidget;
    }
  }

  Widget _loadedWidget(List<Product> products) => ProductListingGridView(
    products: products,
  );

  Widget get _loadingWidget => const Center(
    child: Text('Loading ...'),
  );

  Widget get _failureWidget => const Center(
    child: Text('Oops, something went wrong. Please, try again.'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Organics e-store',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: <Widget>[
          TextButton(
            style: Theme.of(context).textButtonTheme.style,
            onPressed: () {},
            child: const Text("Shop"),
          ),
          TextButton(
            style: Theme.of(context).textButtonTheme.style,
            onPressed: () {},
            child: const Text("Favorites"),
          ),
          TextButton(
            style: Theme.of(context).textButtonTheme.style,
            onPressed: () {},
            child: const Text("My account"),
          ),
          TextButton(
            style: Theme.of(context).textButtonTheme.style,
            onPressed: () {},
            child: const Icon(
              Icons.shopping_cart,
              size: 16,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductListingCubit, ProductListingState>(
        builder: _buildRootWidget,
      ),
    );
  }
}
