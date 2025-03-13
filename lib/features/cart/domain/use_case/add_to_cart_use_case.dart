import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/cart/domain/entity/add_to_cart_response_entity.dart';
import 'package:app_e_commerce/features/cart/domain/repository/cart_repository_contract.dart';
import 'package:dartz/dartz.dart';

class AddToCartUseCase {
  CartRepositoryContract cartRepositoryContract;
  AddToCartUseCase({required this.cartRepositoryContract});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return cartRepositoryContract.addToCart(productId);
  }
}
