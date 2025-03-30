import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:app_e_commerce/features/wishlist/data/mappers/add_to_wishlist_response_dto_mappers.dart';
import 'package:app_e_commerce/features/wishlist/data/mappers/delete_wishlist_item_response_dto_mappers.dart';
import 'package:app_e_commerce/features/wishlist/data/mappers/get_wishlist_response_dto_mappers.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/add_to_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/delete_wishlist_item_response_entity.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/get_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/wishlist/domain/repository/wishlist_repository_contract.dart';
import 'package:dartz/dartz.dart';

class WishlistRepositoryImpl implements WishlistRepositoryContract {
  WishlistRemoteDataSource wishlistRemoteDataSource;
  WishlistRepositoryImpl({required this.wishlistRemoteDataSource});
 

  @override
  Future<Either<Failures, AddToWishlistResponseEntity>> addToWishlist(
      String productId) async {
    var either = await wishlistRemoteDataSource.addToWishlist(productId);

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
    var either = await wishlistRemoteDataSource.getWishlist();

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
  Future<Either<Failures, DeleteWishlistItemResponseEntity>> deleteWishlistItem(
      String productId) async {
    var either = await wishlistRemoteDataSource.deleteWishlistItem(productId);

    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toDeleteWishlistItemResponseEntity());
      },
    );
  }
}
