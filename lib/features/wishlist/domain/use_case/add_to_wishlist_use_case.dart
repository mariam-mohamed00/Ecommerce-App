import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/add_to_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/wishlist/domain/repository/wishlist_repository_contract.dart';
import 'package:dartz/dartz.dart';

class AddToWishlistUseCase {
  WishlistRepositoryContract wishlistRepositoryContract;
  AddToWishlistUseCase({required this.wishlistRepositoryContract});

  Future<Either<Failures, AddToWishlistResponseEntity>> invoke(
      String productId) {
    return wishlistRepositoryContract.addToWishlist(productId);
  }
}
