import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:app_e_commerce/features/cart/data/mappers/add_to_cart_response_dto_mappers.dart';
import 'package:app_e_commerce/features/cart/data/mappers/get_cart_response_dto_mappers.dart';
import 'package:app_e_commerce/features/cart/domain/entity/add_to_cart_response_entity.dart';
import 'package:app_e_commerce/features/cart/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/cart/domain/repository/cart_repository_contract.dart';
import 'package:dartz/dartz.dart';

class CartRepositoryImpl implements CartRepositoryContract {
  CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImpl({required this.cartRemoteDataSource});
 
  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await cartRemoteDataSource.addToCart(productId);

    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toAddToCartResponseEntity());
      },
    );
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await cartRemoteDataSource.getCart();

    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toGetCartResponseEntity());
      },
    );
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(
      String productId) async {
    var either = await cartRemoteDataSource.deleteCartItem(productId);

    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toGetCartResponseEntity());
      },
    );
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountCartItem(
      String productId, int count) async {
    var either =
        await cartRemoteDataSource.updateCountCartItem(productId, count);

    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toGetCartResponseEntity());
      },
    );
  }
}
