import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/repository/product_repository_contract.dart';
import 'package:dartz/dartz.dart';

class GetProductsUseCase {
  ProductRepositoryContract productRepositoryContract;
  GetProductsUseCase({required this.productRepositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return productRepositoryContract.getProducts();
  }
}
