import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/data/model/response/add_to_cart_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/product_response_dto.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseDto>> getCategories();
  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrands();
  Future<Either<Failures, ProductResponseDto>> getProducts();
  Future<Either<Failures, AddToCartResponseDto>> addToCart(String productId);
}
