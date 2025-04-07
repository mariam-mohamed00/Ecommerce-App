import 'package:app_e_commerce/features/auth/data/model/api/auth_api_manager.dart';
import 'package:app_e_commerce/features/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:app_e_commerce/features/auth/data/reposotiry/auth_repository_impl.dart';
import 'package:app_e_commerce/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:app_e_commerce/features/auth/domain/repository/auth_repository_contract.dart';
import 'package:app_e_commerce/features/auth/domain/use_case/login_use_case.dart';
import 'package:app_e_commerce/features/auth/domain/use_case/register_use_case.dart';
import 'package:app_e_commerce/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:app_e_commerce/features/cart/data/data_source/cart_remote_data_source_impl.dart';
import 'package:app_e_commerce/features/cart/data/model/api/cart_api_manager.dart';
import 'package:app_e_commerce/features/cart/data/repository/cart_repository_impl.dart';
import 'package:app_e_commerce/features/cart/domain/repository/cart_repository_contract.dart';
import 'package:app_e_commerce/features/cart/domain/use_case/add_to_cart_use_case.dart';
import 'package:app_e_commerce/features/cart/domain/use_case/delete_cart_item_use_case.dart';
import 'package:app_e_commerce/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:app_e_commerce/features/cart/domain/use_case/update_count_cart_item_use_case.dart';
import 'package:app_e_commerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:app_e_commerce/features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:app_e_commerce/features/home/data/model/api/home_api_manager.dart';
import 'package:app_e_commerce/features/home/data/repository/home_repository_impl.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_brands_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:app_e_commerce/features/products/data/data_source/product_remote_data_source.dart';
import 'package:app_e_commerce/features/products/data/data_source/product_remote_data_source_impl.dart';
import 'package:app_e_commerce/features/products/data/model/api/product_api_manager.dart';
import 'package:app_e_commerce/features/products/data/repository/product_repository_impl.dart';
import 'package:app_e_commerce/features/products/domain/repository/product_repository_contract.dart';
import 'package:app_e_commerce/features/products/domain/use_case/get_products_use_case.dart';
import 'package:app_e_commerce/features/products/domain/use_case/get_specific_product_use_case.dart';
import 'package:app_e_commerce/features/wishlist/data/data_source/wishlist_remote_data_source.dart';
import 'package:app_e_commerce/features/wishlist/data/data_source/wishlist_remote_data_source_impl.dart';
import 'package:app_e_commerce/features/wishlist/data/model/api/wishlist_api_manager.dart';
import 'package:app_e_commerce/features/wishlist/data/repository/wishlist_repository_impl.dart';
import 'package:app_e_commerce/features/wishlist/domain/repository/wishlist_repository_contract.dart';
import 'package:app_e_commerce/features/wishlist/domain/use_case/add_to_wishlist_use_case.dart';
import 'package:app_e_commerce/features/wishlist/domain/use_case/delete_wishlist_item_use_case.dart';
import 'package:app_e_commerce/features/wishlist/domain/use_case/get_wishlist_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(
      authRepositoryContract: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepositoryContract: injectAuthRepositoryContract());
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(authRemoteDataSource: injectAuthRemoteDataSource());
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(authApiManager: AuthApiManager.getInstance());
}

GetCategoriesUseCase injectGetCategoryUseCase() {
  return GetCategoriesUseCase(
      homeRepositoryContract: injectHomeRepositoryContract());
}

GetBrandsUseCase injectGetBrandsUseCase() {
  return GetBrandsUseCase(
      homeRepositoryContract: injectHomeRepositoryContract());
}

GetProductsUseCase injectGetProductsUseCase() {
  return GetProductsUseCase(
      productRepositoryContract: injectProductRepositoryContract());
}

GetSpecificProductUseCase injectGetSpecificProductUseCase() {
  return GetSpecificProductUseCase(
      productRepositoryContract: injectProductRepositoryContract());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(
      cartRepositoryContract: injectCartRepositoryContract());
}

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(cartRepositoryContract: injectCartRepositoryContract());
}

DeleteCartItemUseCase injectDeleteCartItemUseCase() {
  return DeleteCartItemUseCase(
      cartRepositoryContract: injectCartRepositoryContract());
}

UpdateCountCartItemUseCase injectUpdateCountCartItemUseCase() {
  return UpdateCountCartItemUseCase(
      cartRepositoryContract: injectCartRepositoryContract());
}

AddToWishlistUseCase injectAddToWishlistUseCase() {
  return AddToWishlistUseCase(
      wishlistRepositoryContract: injectWishlistRepositoryContract());
}

GetWishlistUseCase injectGetWishlistUseCase() {
  return GetWishlistUseCase(
      wishlistRepositoryContract: injectWishlistRepositoryContract());
}

DeleteWishlistItemtUseCase injectDeleteWishlistItemtUseCase() {
  return DeleteWishlistItemtUseCase(
      wishlistRepositoryContract: injectWishlistRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(homeRemoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(homeApiManager: HomeApiManager.getInstance());
}

ProductRepositoryContract injectProductRepositoryContract() {
  return ProductRepositoryImpl(
      productRemoteDataSource: injectProductRemoteDataSource());
}

ProductRemoteDataSource injectProductRemoteDataSource() {
  return ProductRemoteDataSourceImpl(
      productApiManager: ProductApiManager.getInstance());
}

CartRepositoryContract injectCartRepositoryContract() {
  return CartRepositoryImpl(cartRemoteDataSource: injectCartRemoteDataSource());
}

CartRemoteDataSource injectCartRemoteDataSource() {
  return CartRemoteDataSourceImpl(cartApiManager: CartApiManager.getInstance());
}

WishlistRepositoryContract injectWishlistRepositoryContract() {
  return WishlistRepositoryImpl(
      wishlistRemoteDataSource: injectWishlistRemoteDataSource());
}

WishlistRemoteDataSource injectWishlistRemoteDataSource() {
  return WishlistRemoteDataSourceImpl(
      wishlistApiManager: WishlistApiManager.getInstance());
}
