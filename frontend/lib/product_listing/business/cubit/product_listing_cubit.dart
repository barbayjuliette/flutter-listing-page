import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_listing_state.dart';

class ProductListingCubit extends Cubit<ProductListingState> {
  ProductListingCubit() : super(ProductListingInitial());

  loadProducts() async {
    if (state is ProductListingLoading) {
      return;
    }

    emit(ProductListingLoading());

    await Future<void>.delayed(const Duration(seconds: 1));
    emit(ProductListingLoaded());
  }
}
