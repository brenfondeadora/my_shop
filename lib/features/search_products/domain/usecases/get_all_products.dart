import 'package:dartz/dartz.dart';
import 'package:my_shop/features/search_products/domain/entities/all_product.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/product_repository.dart';

class GetAllProducts implements UseCase<AllProduct> {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  @override
  Future<Either<Failure, AllProduct>> call() async {
    return await repository.getAllProducts();
  }
}
