import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/add_to_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/get_wishlist_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRepositoryContract {
  Future<Either<Failures, AddToWishlistResponseEntity>> addToWishlist(
      String productId);

  Future<Either<Failures, GetWishlistResponseEntity>> getWishlist();

  // Future<Either<Failures, GetWishlistResponseEntity>> deleteWishlistItem(
  //   String productId);
}
