import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:dartz/dartz.dart';

class AddToWishlistUseCase {
  HomeRepositoryContract homeRepositoryContract;
  AddToWishlistUseCase({required this.homeRepositoryContract});

  Future<Either<Failures, AddToWishlistResponseEntity>> invoke(
      String productId) {
    return homeRepositoryContract.addToWishlist(productId);
  }
}
