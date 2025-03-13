import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/data/data_source/product_remote_data_source.dart';
import 'package:app_e_commerce/features/products/data/model/api/product_api_manager.dart';
import 'package:app_e_commerce/features/products/data/model/response/product_response_dto.dart';
import 'package:dartz/dartz.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  ProductApiManager productApiManager;
  ProductRemoteDataSourceImpl({required this.productApiManager});

  @override
  Future<Either<Failures, ProductResponseDto>> getProducts() async {
    var either = await productApiManager.getProducts();
    return either.fold((l) {
      return Left(Failures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r);
    });
  }
}
