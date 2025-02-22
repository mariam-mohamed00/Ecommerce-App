import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:app_e_commerce/features/home/data/model/api/home_api_manager.dart';
import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/product_response_dto.dart';
import 'package:dartz/dartz.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeApiManager homeApiManager;
  HomeRemoteDataSourceImpl({required this.homeApiManager});
  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getCategories() async {
    var either = await homeApiManager.getCategories();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrands() async {
    var either = await homeApiManager.getBrands();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }

  @override
  Future<Either<Failures, ProductResponseDto>> getProducts() async{
     var either = await homeApiManager.getProducts();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
}
