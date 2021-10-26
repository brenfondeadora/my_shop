import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_shop/core/error/exceptions.dart';
import 'package:my_shop/features/search_products/data/models/all_products_model.dart';

abstract class ProductRemoteDataSource {
  /// Call the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<AllProductsModel> getAllProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({@required this.client});

  @override
  Future<AllProductsModel> getAllProducts() async {
    final response = await client.get(
      Uri.parse(''),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return AllProductsModel.fromJson(json.decode(response.body));
    } else {
      throw (ServerException());
    }
  }
}
