import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_shop/features/products/data/models/all_products_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tAllProductModel = AllProductsModel(
    [
      ProductModel(
        id: 'id01',
        title: 'Jordan 1990',
        details: 'Nostalgia de los 90s',
        image: 'https://via.placeholder.com/150',
        sizes: ['5.5', '6', '6.5', '7'],
        price: 2589.90,
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

/*
    test(
      'should return a valid model when the JSON number is regarded as a double',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('trivia_double.json'));
        //act
        final result = NumberTriviaModel.fromJson(jsonMap);
        //assert
        expect(result, tNumberTriviaModel);
      },
    );*/
  });

/*
  group('toJson =>', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        //arrange
        final result = tNumberTriviaModel.toJson();
        //assert
        final expectedMap = {
          "text": "Test Text",
          "number": 1,
        };
        expect(result, expectedMap);
      },
    );
  });*/
}
