import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/product_response_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepositoryContract {
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandResponseEntity>> getBrands();

  Future<Either<Failures, ProductResponseEntity>> getProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);

  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteCartItem(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountCartItem(
      String productId, int count);

  Future<Either<Failures, AddToWishlistResponseEntity>> addToWishlist(
      String productId);

  Future<Either<Failures, GetWishlistResponseEntity>> getWishlist();

    Future<Either<Failures, GetWishlistResponseEntity>> deleteWishlistItem(
      String productId);
}
