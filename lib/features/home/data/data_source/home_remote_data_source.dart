import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/data/model/response/add_to_cart_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/add_to_wishlist_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/get_cart_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/get_wishlist_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/product_response_dto.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, CategoryOrBrandResponseDto>> getCategories();
  Future<Either<Failures, CategoryOrBrandResponseDto>> getBrands();
  Future<Either<Failures, ProductResponseDto>> getProducts();
  Future<Either<Failures, AddToCartResponseDto>> addToCart(String productId);
  Future<Either<Failures, GetCartResponseDto>> getCart();
  Future<Either<Failures, GetCartResponseDto>> deleteCartItem(String productId);
  Future<Either<Failures, GetCartResponseDto>> updateCountCartItem(
      String productId, int count);
  Future<Either<Failures, AddToWishlistResponseDto>> addToWishlist(
      String productId);
        Future<Either<Failures, GetWishlistResponseDto>> getWishlist();
  Future<Either<Failures, GetWishlistResponseDto>> deleteWishlistItem(String productId);

}
