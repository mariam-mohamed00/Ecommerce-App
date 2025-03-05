import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:dartz/dartz.dart';

class DeleteWishlistItemtUseCase {
   HomeRepositoryContract homeRepositoryContract;
  DeleteWishlistItemtUseCase({required this.homeRepositoryContract});

  Future<Either<Failures, GetWishlistResponseEntity>> invoke(String productId){
    return homeRepositoryContract.deleteWishlistItem(productId);
  }
}