import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:app_e_commerce/features/wishlist/data/model/api/wishlist_api_manager.dart';
import 'package:app_e_commerce/features/wishlist/data/model/response/add_to_wishlist_response_dto.dart';
import 'package:app_e_commerce/features/wishlist/data/model/response/delete_wishlist_item_response_dto.dart';
import 'package:app_e_commerce/features/wishlist/data/model/response/get_wishlist_response_dto.dart';
import 'package:dartz/dartz.dart';

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  WishlistApiManager wishlistApiManager;
  WishlistRemoteDataSourceImpl({required this.wishlistApiManager});
 
  @override
  Future<Either<Failures, AddToWishlistResponseDto>> addToWishlist(
      String productId) async {
    var either = await wishlistApiManager.addToWishlist(productId);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, GetWishlistResponseDto>> getWishlist() async{
   var either = await wishlistApiManager.getWishlist();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
  
  @override
  Future<Either<Failures, DeleteWishlistItemResponseDto>> deleteWishlistItem(String productId) async{
    var either = await wishlistApiManager.deleteWishlistItem(productId);
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

}
