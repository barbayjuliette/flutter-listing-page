import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/product_listing_repository.dart';
import '../../model/product.dart';

part 'product_listing_state.dart';

class ProductListingCubit extends Cubit<ProductListingState> {
  final ProductListingRepository repository;

  ProductListingCubit({required this.repository}) : super(ProductListingInitial());

  loadProducts({required String searchTerm}) async {
    if (state is ProductListingLoading) {
      return;
    }

    emit(ProductListingLoading());

    try {
      final products = await repository.fetchProducts(searchTerm: searchTerm);
      emit(ProductListingLoaded(products: products));
    }
    catch(_) {
      emit(ProductListingFailure());
    }
  }
}
