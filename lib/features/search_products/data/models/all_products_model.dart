import 'package:flutter/foundation.dart';
import 'package:my_shop/features/search_products/domain/entities/all_product.dart';
import 'package:my_shop/features/search_products/domain/entities/product.dart';

class AllProductsModel extends AllProduct {
  AllProductsModel({
    @required List<Product> products,
  }) : super(
          products: products,
        );

  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> products = [];
    if (json['products'] != null) {
      for (Map jsonMap in json['products']) {
        products.add(ProductModel.fromJson(jsonMap));
      }
    }

    return AllProductsModel(
      products: products,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products,
    };
  }
}

class ProductModel extends Product {
  ProductModel({
    @required String id,
    @required String title,
    @required String details,
    @required String image,
    List<String> sizes,
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
      sizes: json["sizes"] != null
          ? List<String>.from(json["sizes"].map((x) => x))
          : [],
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
