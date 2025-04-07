import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/cart/data/model/response/add_to_cart_response_dto.dart';
import 'package:app_e_commerce/features/cart/data/model/response/get_cart_response_dto.dart';
import 'package:dartz/dartz.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, AddToCartResponseDto>> addToCart(String productId);
  Future<Either<Failures, GetCartResponseDto>> getCart();
  Future<Either<Failures, GetCartResponseDto>> deleteCartItem(String productId);
  Future<Either<Failures, GetCartResponseDto>> updateCountCartItem(
      String productId, int count);
 
}
