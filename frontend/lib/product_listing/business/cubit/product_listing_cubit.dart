import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/product_listing_repository.dart';
import '../../model/product.dart';

part 'product_listing_state.dart';

class ProductListingCubit extends Cubit<ProductListingState> {
  final ProductListingRepository repository;

  ProductListingCubit({required this.repository}) : super(ProductListingInitial());

  loadProducts() async {
    if (state is ProductListingLoading) {
      return;
    }

    emit(ProductListingLoading());

    final products = await repository.fetchProducts();
    emit(ProductListingLoaded(products: products));
  }
}
