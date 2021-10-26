import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:my_shop/core/error/exceptions.dart';
import 'package:my_shop/core/error/failures.dart';
import 'package:my_shop/core/network/network_info.dart';
import 'package:my_shop/features/search_products/data/datasources/product_remote_datasource.dart';
import 'package:my_shop/features/search_products/domain/entities/all_product.dart';
import 'package:my_shop/features/search_products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, AllProduct>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final allProducts = await remoteDataSource.getAllProducts();
        return Right(allProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }
}
