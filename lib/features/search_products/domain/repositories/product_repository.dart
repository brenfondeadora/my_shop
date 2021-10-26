import 'package:dartz/dartz.dart';
import 'package:my_shop/features/search_products/domain/entities/all_product.dart';

import '../../../../core/error/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, AllProduct>> getAllProducts();
}
