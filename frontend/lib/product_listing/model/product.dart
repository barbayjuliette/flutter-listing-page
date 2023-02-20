import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String description;
  final String photo;
  final int price;
  final int stock;

  const Product({
    required this.name,
    required this.description,
    required this.photo,
    required this.price,
    required this.stock,
  });

  @override
  List<Object> get props => [
    name,
    description,
    photo,
    price,
    stock,
  ];
}
