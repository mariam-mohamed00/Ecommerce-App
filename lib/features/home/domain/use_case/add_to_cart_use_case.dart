import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:dartz/dartz.dart';

class AddToCartUseCase {
  HomeRepositoryContract homeRepositoryContract;
  AddToCartUseCase({required this.homeRepositoryContract});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return homeRepositoryContract.addToCart(productId);
  }
}
