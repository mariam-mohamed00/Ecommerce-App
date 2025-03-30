import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/delete_wishlist_item_response_entity.dart';
import 'package:app_e_commerce/features/wishlist/domain/repository/wishlist_repository_contract.dart';
import 'package:dartz/dartz.dart';

class DeleteWishlistItemtUseCase {
   WishlistRepositoryContract wishlistRepositoryContract;
  DeleteWishlistItemtUseCase({required this.wishlistRepositoryContract});

  Future<Either<Failures, DeleteWishlistItemResponseEntity>> invoke(String productId){
    return wishlistRepositoryContract.deleteWishlistItem(productId);
  }
}