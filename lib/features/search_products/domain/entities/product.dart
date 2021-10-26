import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String details;
  final String image;
  final List<String> sizes;
  final double price;

  Product({
    @required this.id,
    @required this.title,
    @required this.details,
    @required this.image,
    @required this.sizes,
    @required this.price,
  });

  @override
  List<Object> get props => [id, title, details, image, sizes, price];
}
