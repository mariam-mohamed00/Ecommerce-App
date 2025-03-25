import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/data/data_source/product_remote_data_source.dart';
import 'package:app_e_commerce/features/products/data/mappers/product_response_dto_mappers.dart';
import 'package:app_e_commerce/features/products/data/mappers/specific_product_response_dto_mappers.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/entity/specific_product_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/repository/product_repository_contract.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepositoryContract {
  ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({required this.productRemoteDataSource});
 
  @override
  Future<Either<Failures, ProductResponseEntity>> getProducts() async {
    var either = await productRemoteDataSource.getProducts();
    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toProductResponseEntity());
      },
    );
  }
  
  @override
  Future<Either<Failures, SpecificProductResponseEntity>> getSpecificProduct(String productId) async{
     var either = await productRemoteDataSource.getSpecificProduct(productId);
    return either.fold(
      (l) {
        return Left(Failures(errorMessage: l.errorMessage));
      },
      (r) {
        return Right(r.toSpecificProductResponseEntity());
      },
    );
  }
}
