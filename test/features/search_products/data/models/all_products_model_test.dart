import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_shop/features/search_products/data/models/all_products_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tAllProductModel = AllProductsModel(
    products: [
      ProductModel(
        id: 'id01',
        title: 'Jordan 1990',
        details: 'Nostalgia de los 90s',
        image: 'https://via.placeholder.com/150',
        sizes: ['5.5', '6', '6.5', '7'],
        price: 2589,
      ),
    ],
  );

  final tAllProductNoSizesModel = AllProductsModel(
    products: [
      ProductModel(
        id: 'id01',
        title: 'Jordan 1990',
        details: 'Nostalgia de los 90s',
        image: 'https://via.placeholder.com/150',
        sizes: [],
        price: 2589,
      ),
    ],
  );

  test(
    'should be a subclass of AllProductsModel entity',
    () async {
      //assert
      expect(tAllProductModel, isA<AllProductsModel>());
    },
  );

  group('fromJson =>', () {
    test(
      'should return a valid model when the JSON is like productModel',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('products.json'));
        //act
        final result = AllProductsModel.fromJson(jsonMap);
        //assert
        expect(result, tAllProductModel);
      },
    );

    test(
      'should return a valid model when the JSON price is regarded as a double',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('products_double_price.json'));
        //act
        final result = AllProductsModel.fromJson(jsonMap);
        //assert
        expect(result, tAllProductModel);
      },
    );

    test(
      'should return a valid model when the JSON size is empty',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('products_empty_sizes.json'));
        //act
        final result = AllProductsModel.fromJson(jsonMap);
        //assert
        expect(result, tAllProductNoSizesModel);
      },
    );

    test(
      'should return a valid model when the JSON size is null',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('products_sizes_null.json'));
        //act
        final result = AllProductsModel.fromJson(jsonMap);
        //assert
        expect(result, tAllProductNoSizesModel);
      },
    );
  });
}
