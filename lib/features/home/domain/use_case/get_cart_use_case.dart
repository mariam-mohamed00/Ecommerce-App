import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:dartz/dartz.dart';

class GetCartUseCase {
  HomeRepositoryContract homeRepositoryContract;
  GetCartUseCase({required this.homeRepositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return homeRepositoryContract.getCart();
  }
}
