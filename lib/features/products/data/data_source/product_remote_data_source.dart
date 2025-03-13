import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/data/model/response/product_response_dto.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRemoteDataSource {
  Future<Either<Failures, ProductResponseDto>> getProducts();
}
