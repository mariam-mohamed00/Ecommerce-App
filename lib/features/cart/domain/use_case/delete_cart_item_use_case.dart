import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/cart/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/cart/domain/repository/cart_repository_contract.dart';
import 'package:dartz/dartz.dart';

class DeleteCartItemUseCase {
   CartRepositoryContract cartRepositoryContract;
  DeleteCartItemUseCase({required this.cartRepositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId){
    return cartRepositoryContract.deleteCartItem(productId);
  }
}