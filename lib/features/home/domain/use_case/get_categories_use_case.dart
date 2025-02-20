import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesUseCase {
  HomeRepositoryContract homeRepositoryContract;
  GetCategoriesUseCase({required this.homeRepositoryContract});

  Future<Either<Failures, CategoryOrBrandResponseEntity>> invoke() {
    return homeRepositoryContract.getCategories();
  }
}
