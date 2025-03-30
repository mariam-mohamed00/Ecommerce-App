import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/wishlist/data/model/response/add_to_wishlist_response_dto.dart';
import 'package:app_e_commerce/features/wishlist/data/model/response/delete_wishlist_item_response_dto.dart';
import 'package:app_e_commerce/features/wishlist/data/model/response/get_wishlist_response_dto.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRemoteDataSource {
  Future<Either<Failures, AddToWishlistResponseDto>> addToWishlist(
      String productId);
  Future<Either<Failures, GetWishlistResponseDto>> getWishlist();
  Future<Either<Failures, DeleteWishlistItemResponseDto>> deleteWishlistItem(String productId);
}
