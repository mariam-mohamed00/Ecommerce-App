import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepositoryContract {
  Future<Either<Failures, ProductResponseEntity>> getProducts();
}
