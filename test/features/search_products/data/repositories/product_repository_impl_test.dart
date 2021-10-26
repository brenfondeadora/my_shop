import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_shop/core/network/network_info.dart';
import 'package:my_shop/features/search_products/data/datasources/product_remote_datasource.dart';
import 'package:my_shop/features/search_products/data/models/all_products_model.dart';
import 'package:my_shop/features/search_products/data/repositories/product_repository_impl.dart';
import 'package:my_shop/features/search_products/domain/entities/all_product.dart';

class MockRemoteDataSource extends Mock implements ProductRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ProductRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online =>', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline =>', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getAllProducts =>', () {
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
    final AllProduct tProducts = tAllProductModel;

    test(
      'should check if the device is online',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(true));
        //act
        repository.getAllProducts();
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote date when the call to remote data source is successful',
        () async {
          //arrange
          when(mockRemoteDataSource.getAllProducts())
              .thenAnswer((_) => Future.value(tAllProductModel));
          //act
          final result = await repository.getAllProducts();
          //assert
          verify(mockRemoteDataSource.getAllProducts());
          expect(result, equals(Right(tProducts)));
        },
      );
    });
  });
}
