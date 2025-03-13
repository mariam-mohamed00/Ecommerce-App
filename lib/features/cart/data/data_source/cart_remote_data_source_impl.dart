import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:app_e_commerce/features/cart/data/model/api/cart_api_manager.dart';
import 'package:app_e_commerce/features/cart/data/model/response/add_to_cart_response_dto.dart';
import 'package:app_e_commerce/features/cart/data/model/response/get_cart_response_dto.dart';
import 'package:dartz/dartz.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  CartApiManager cartApiManager;
  CartRemoteDataSourceImpl({required this.cartApiManager});

  @override
  Future<Either<Failures, AddToCartResponseDto>> addToCart(
      String productId) async {
    var either = await cartApiManager.addToCart(productId);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    var either = await cartApiManager.getCart();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> deleteCartItem(
      String productId) async {
    var either = await cartApiManager.deleteCartItem(productId);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> updateCountCartItem(
      String productId, int count) async {
    var either = await cartApiManager.updateCountCartItem(productId, count);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

}
