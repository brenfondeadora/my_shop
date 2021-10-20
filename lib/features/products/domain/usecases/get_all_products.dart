import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetAllProducts implements UseCase<List<Product>> {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  @override
  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProducts();
  }
}
