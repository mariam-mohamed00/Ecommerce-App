import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:dartz/dartz.dart';

class UpdateCountCartItemUseCase {
   HomeRepositoryContract homeRepositoryContract;
  UpdateCountCartItemUseCase({required this.homeRepositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId, int count){
    return homeRepositoryContract.updateCountCartItem(productId, count);
  }
}