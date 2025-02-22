import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:dartz/dartz.dart';

class GetProductsUseCase {
  HomeRepositoryContract homeRepositoryContract;
  GetProductsUseCase({required this.homeRepositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeRepositoryContract.getProducts();
  }
}
