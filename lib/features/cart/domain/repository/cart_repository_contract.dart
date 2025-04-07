import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/cart/domain/entity/add_to_cart_response_entity.dart';
import 'package:app_e_commerce/features/cart/domain/entity/get_cart_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CartRepositoryContract {
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);

  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountCartItem(
      String productId, int count);
}
