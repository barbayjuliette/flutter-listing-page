part of 'product_listing_cubit.dart';

abstract class ProductListingState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductListingInitial extends ProductListingState {}

class ProductListingLoading extends ProductListingState {}

class ProductListingLoaded extends ProductListingState {}

class ProductListingFailure extends ProductListingState {}
