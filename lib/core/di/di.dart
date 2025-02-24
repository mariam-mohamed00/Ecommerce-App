import 'package:app_e_commerce/features/auth/data/model/api/auth_api_manager.dart';
import 'package:app_e_commerce/features/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:app_e_commerce/features/auth/data/reposotiry/auth_repository_impl.dart';
import 'package:app_e_commerce/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:app_e_commerce/features/auth/domain/repository/auth_repository_contract.dart';
import 'package:app_e_commerce/features/auth/domain/use_case/login_use_case.dart';
import 'package:app_e_commerce/features/auth/domain/use_case/register_use_case.dart';
import 'package:app_e_commerce/features/home/data/data_source/home_remote_data_source.dart';
import 'package:app_e_commerce/features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:app_e_commerce/features/home/data/model/api/home_api_manager.dart';
import 'package:app_e_commerce/features/home/data/repository/home_repository_impl.dart';
import 'package:app_e_commerce/features/home/domain/repository/home_repository_contract.dart';
import 'package:app_e_commerce/features/home/domain/use_case/add_to_cart_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/delet_cart_item_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_brands_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_cart_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_products_use_case.dart';

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
      homeRepositoryContract: injectHomeRepositoryContract());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(
      homeRepositoryContract: injectHomeRepositoryContract());
}

GetCartUseCase injectGetCartUseCase() {
  return GetCartUseCase(
      homeRepositoryContract: injectHomeRepositoryContract());
}

DeleteCartItemUseCase injectDeleteCartItemUseCase() {
  return DeleteCartItemUseCase(
      homeRepositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(homeRemoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(homeApiManager: HomeApiManager.getInstance());
}
