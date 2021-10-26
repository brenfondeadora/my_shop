import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_shop/features/search_products/domain/entities/product.dart';

class AllProduct extends Equatable {
  final List<Product> products;

  AllProduct({
    @required this.products,
  });

  @override
  List<Object> get props => [products];
}
