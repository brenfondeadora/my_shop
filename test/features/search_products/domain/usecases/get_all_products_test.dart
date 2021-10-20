import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_shop/features/products/domain/entities/product.dart';
import 'package:my_shop/features/products/domain/repositories/product_repository.dart';
import 'package:my_shop/features/products/domain/usecases/get_all_products.dart';

class MockProductRepository extends Mock implements ProductRepository {}

void main() {
  GetAllProducts usecase;
  MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetAllProducts(mockProductRepository);
  });

  final tProducts = [
    Product(
      id: 'id1',
      title: 'Tenis Barricade',
      details: 'Sin control no hay garantías en la cancha',
      image: '',
      sizes: ['5', '5.5', '6'],
      price: 3669.0,
    ),
    Product(
      id: 'id2',
      title: 'Tenis Adidas Ultraboost ',
      details: 'Sin control no hay garantías en la cancha',
      image: '',
      sizes: ['5', '5.5', '6'],
      price: 3999.0,
    ),
  ];
  test(
    'should get all the products from the repository',
    () async {
      //arrange
      when(mockProductRepository.getAllProducts())
          .thenAnswer((_) async => Right(tProducts));
      //act
      final result = await usecase();
      //assert
      expect(result, Right(tProducts));
      verify(mockProductRepository.getAllProducts());
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}
