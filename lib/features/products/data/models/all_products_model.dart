// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_shop/features/products/domain/entities/product.dart';

class AllProductsModel extends Equatable {
  List<ProductModel> products;

  AllProductsModel(this.products);

  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> products = [];
    if (json['products'] != null) {
      for (Map jsonMap in json['products']) {
        products.add(ProductModel.fromJson(jsonMap));
      }
    }

    return AllProductsModel(
      products,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products,
    };
  }

  @override
  List<Object> get props => [products];
}

class ProductModel extends Product {
  ProductModel({
    @required String id,
    @required String title,
    @required String details,
    @required String image,
    @required List<String> sizes,
    @required double price,
  }) : super(
          id: id,
          title: title,
          details: details,
          image: image,
          sizes: sizes,
          price: price,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      details: json['details'],
      image: json['image'],
      sizes: List<String>.from(json["sizes"].map((x) => x)),
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'details': details,
      'image': image,
      'sizes': sizes,
      'price': price,
    };
  }
}
