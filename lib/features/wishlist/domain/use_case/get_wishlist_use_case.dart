import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/get_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/wishlist/domain/repository/wishlist_repository_contract.dart';
import 'package:dartz/dartz.dart';

class GetWishlistUseCase {
  WishlistRepositoryContract wishlistRepositoryContract;
  GetWishlistUseCase({required this.wishlistRepositoryContract});

  Future<Either<Failures, GetWishlistResponseEntity>> invoke() {
    return wishlistRepositoryContract.getWishlist();
  }
}
