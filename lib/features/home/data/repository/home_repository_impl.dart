import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:app_e_commerce/features/home/data/mappers/add_to_cart_response_dto_mappers.dart';
import 'package:app_e_commerce/features/home/data/mappers/add_to_wishlist_response_dto_mappers.dart';
import 'package:app_e_commerce/features/home/data/mappers/category_or_brand_response_dto_mappers.dart';
import 'package:app_e_commerce/features/home/data/mappers/get_cart_response_dto_mappers.dart';
import 'package:app_e_commerce/features/home/data/mappers/get_wishlist_response_dto_mappers.dart';
import 'package:app_e_commerce/features/home/data/mappers/product_response_dto_mappers.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepositoryContract {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
      getCategories() async {
    var either = await homeRemoteDataSource.getCategories();
    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toCategoryOrBrandResponseEntity());
      },
    );
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands() async {
    var either = await homeRemoteDataSource.getBrands();
    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toCategoryOrBrandResponseEntity());
      },
    );
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await homeRemoteDataSource.getProducts();
    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toProductResponseEntity());
      },
    );
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(
      String productId) async {
    var either = await homeRemoteDataSource.addToCart(productId);

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
    var either = await homeRemoteDataSource.getCart();

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
    var either = await homeRemoteDataSource.deleteCartItem(productId);

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
        await homeRemoteDataSource.updateCountCartItem(productId, count);

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
  Future<Either<Failures, AddToWishlistResponseEntity>> addToWishlist(
      String productId) async {
    var either = await homeRemoteDataSource.addToWishlist(productId);

    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toAddToWishlistEntity());
      },
    );
  }

  @override
  Future<Either<Failures, GetWishlistResponseEntity>> getWishlist() async {
    var either = await homeRemoteDataSource.getWishlist();

    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toGetWishlistResponseEntity());
      },
    );
  }

  @override
  Future<Either<Failures, GetWishlistResponseEntity>> deleteWishlistItem(
      String productId) async {
    var either = await homeRemoteDataSource.deleteWishlistItem(productId);

    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toGetWishlistResponseEntity());
      },
    );
  }
}
