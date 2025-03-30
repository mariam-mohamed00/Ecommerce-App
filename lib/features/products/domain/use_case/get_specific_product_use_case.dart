import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/domain/entity/specific_product_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/repository/product_repository_contract.dart';
import 'package:dartz/dartz.dart';

class GetSpecificProductUseCase {
  ProductRepositoryContract productRepositoryContract;
  GetSpecificProductUseCase({required this.productRepositoryContract});

  Future<Either<Failures, SpecificProductResponseEntity>> invoke(String productId) {
    return productRepositoryContract.getSpecificProduct(productId);
  }
}
