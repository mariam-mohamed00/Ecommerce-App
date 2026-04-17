// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/auth_remote_data_source.dart'
    as _i182;
import '../../features/auth/data/data_source/auth_remote_data_source_impl.dart'
    as _i508;
import '../../features/auth/data/model/api/auth_api_manager.dart' as _i592;
import '../../features/auth/data/reposotiry/auth_repository_impl.dart' as _i980;
import '../../features/auth/domain/repository/auth_repository_contract.dart'
    as _i601;
import '../../features/auth/domain/use_case/login_use_case.dart' as _i973;
import '../../features/auth/domain/use_case/register_use_case.dart' as _i463;
import '../../features/auth/presentation/cubit/login_cubit.dart' as _i69;
import '../../features/auth/presentation/cubit/register_cubit.dart' as _i759;
import '../../features/cart/data/data_source/cart_remote_data_source.dart'
    as _i1026;
import '../../features/cart/data/data_source/cart_remote_data_source_impl.dart'
    as _i766;
import '../../features/cart/data/model/api/cart_api_manager.dart' as _i843;
import '../../features/cart/data/repository/cart_repository_impl.dart'
    as _i1063;
import '../../features/cart/domain/repository/cart_repository_contract.dart'
    as _i544;
import '../../features/cart/domain/use_case/add_to_cart_use_case.dart' as _i956;
import '../../features/cart/domain/use_case/delete_cart_item_use_case.dart'
    as _i903;
import '../../features/cart/domain/use_case/get_cart_use_case.dart' as _i38;
import '../../features/cart/domain/use_case/update_count_cart_item_use_case.dart'
    as _i818;
import '../../features/cart/presentation/cubit/cart_screen_cubit.dart' as _i627;
import '../../features/home/data/data_source/home_remote_data_source.dart'
    as _i283;
import '../../features/home/data/data_source/home_remote_data_source_impl.dart'
    as _i238;
import '../../features/home/data/model/api/home_api_manager.dart' as _i432;
import '../../features/home/data/repository/home_repository_impl.dart' as _i9;
import '../../features/home/domain/repository/home_repository_contract.dart'
    as _i443;
import '../../features/home/domain/use_case/get_brands_use_case.dart' as _i29;
import '../../features/home/domain/use_case/get_categories_use_case.dart'
    as _i215;
import '../../features/home/presentation/cubit/home_tab_cubit.dart' as _i560;
import '../../features/products/data/data_source/product_remote_data_source.dart'
    as _i949;
import '../../features/products/data/data_source/product_remote_data_source_impl.dart'
    as _i753;
import '../../features/products/data/model/api/product_api_manager.dart'
    as _i52;
import '../../features/products/data/repository/product_repository_impl.dart'
    as _i554;
import '../../features/products/domain/repository/product_repository_contract.dart'
    as _i719;
import '../../features/products/domain/use_case/get_products_use_case.dart'
    as _i1071;
import '../../features/products/domain/use_case/get_specific_product_use_case.dart'
    as _i296;
import '../../features/products/presentation/cubit/product_tab_cubit.dart'
    as _i427;
import '../../features/wishlist/data/data_source/wishlist_remote_data_source.dart'
    as _i474;
import '../../features/wishlist/data/data_source/wishlist_remote_data_source_impl.dart'
    as _i94;
import '../../features/wishlist/data/model/api/wishlist_api_manager.dart'
    as _i489;
import '../../features/wishlist/data/repository/wishlist_repository_impl.dart'
    as _i669;
import '../../features/wishlist/domain/repository/wishlist_repository_contract.dart'
    as _i19;
import '../../features/wishlist/domain/use_case/add_to_wishlist_use_case.dart'
    as _i527;
import '../../features/wishlist/domain/use_case/delete_wishlist_item_use_case.dart'
    as _i493;
import '../../features/wishlist/domain/use_case/get_wishlist_use_case.dart'
    as _i859;
import '../../features/wishlist/presentation/cubit/wishlist_screen_cubit.dart'
    as _i652;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i592.AuthApiManager>(() => _i592.AuthApiManager());
    gh.lazySingleton<_i843.CartApiManager>(() => _i843.CartApiManager());
    gh.lazySingleton<_i432.HomeApiManager>(() => _i432.HomeApiManager());
    gh.lazySingleton<_i52.ProductApiManager>(() => _i52.ProductApiManager());
    gh.lazySingleton<_i489.WishlistApiManager>(
        () => _i489.WishlistApiManager());
    gh.lazySingleton<_i283.HomeRemoteDataSource>(() =>
        _i238.HomeRemoteDataSourceImpl(
            homeApiManager: gh<_i432.HomeApiManager>()));
    gh.lazySingleton<_i1026.CartRemoteDataSource>(() =>
        _i766.CartRemoteDataSourceImpl(
            cartApiManager: gh<_i843.CartApiManager>()));
    gh.lazySingleton<_i949.ProductRemoteDataSource>(() =>
        _i753.ProductRemoteDataSourceImpl(
            productApiManager: gh<_i52.ProductApiManager>()));
    gh.lazySingleton<_i182.AuthRemoteDataSource>(() =>
        _i508.AuthRemoteDataSourceImpl(
            authApiManager: gh<_i592.AuthApiManager>()));
    gh.lazySingleton<_i443.HomeRepositoryContract>(() => _i9.HomeRepositoryImpl(
        homeRemoteDataSource: gh<_i283.HomeRemoteDataSource>()));
    gh.lazySingleton<_i474.WishlistRemoteDataSource>(() =>
        _i94.WishlistRemoteDataSourceImpl(
            wishlistApiManager: gh<_i489.WishlistApiManager>()));
    gh.lazySingleton<_i544.CartRepositoryContract>(() =>
        _i1063.CartRepositoryImpl(
            cartRemoteDataSource: gh<_i1026.CartRemoteDataSource>()));
    gh.lazySingleton<_i601.AuthRepositoryContract>(() =>
        _i980.AuthRepositoryImpl(
            authRemoteDataSource: gh<_i182.AuthRemoteDataSource>()));
    gh.lazySingleton<_i956.AddToCartUseCase>(() => _i956.AddToCartUseCase(
        cartRepositoryContract: gh<_i544.CartRepositoryContract>()));
    gh.lazySingleton<_i903.DeleteCartItemUseCase>(() =>
        _i903.DeleteCartItemUseCase(
            cartRepositoryContract: gh<_i544.CartRepositoryContract>()));
    gh.lazySingleton<_i38.GetCartUseCase>(() => _i38.GetCartUseCase(
        cartRepositoryContract: gh<_i544.CartRepositoryContract>()));
    gh.lazySingleton<_i818.UpdateCountCartItemUseCase>(() =>
        _i818.UpdateCountCartItemUseCase(
            cartRepositoryContract: gh<_i544.CartRepositoryContract>()));
    gh.lazySingleton<_i29.GetBrandsUseCase>(() => _i29.GetBrandsUseCase(
        homeRepositoryContract: gh<_i443.HomeRepositoryContract>()));
    gh.lazySingleton<_i215.GetCategoriesUseCase>(() =>
        _i215.GetCategoriesUseCase(
            homeRepositoryContract: gh<_i443.HomeRepositoryContract>()));
    gh.lazySingleton<_i719.ProductRepositoryContract>(() =>
        _i554.ProductRepositoryImpl(
            productRemoteDataSource: gh<_i949.ProductRemoteDataSource>()));
    gh.lazySingleton<_i1071.GetProductsUseCase>(() => _i1071.GetProductsUseCase(
        productRepositoryContract: gh<_i719.ProductRepositoryContract>()));
    gh.lazySingleton<_i296.GetSpecificProductUseCase>(() =>
        _i296.GetSpecificProductUseCase(
            productRepositoryContract: gh<_i719.ProductRepositoryContract>()));
    gh.singleton<_i560.HomeTabCubit>(() => _i560.HomeTabCubit(
          getCategoriesUseCase: gh<_i215.GetCategoriesUseCase>(),
          getBrandsUseCase: gh<_i29.GetBrandsUseCase>(),
        ));
    gh.lazySingleton<_i973.LoginUseCase>(() => _i973.LoginUseCase(
        authRepositoryContract: gh<_i601.AuthRepositoryContract>()));
    gh.lazySingleton<_i463.RegisterUseCase>(() => _i463.RegisterUseCase(
        authRepositoryContract: gh<_i601.AuthRepositoryContract>()));
    gh.singleton<_i759.RegisterCubit>(() =>
        _i759.RegisterCubit(registerUseCase: gh<_i463.RegisterUseCase>()));
    gh.lazySingleton<_i19.WishlistRepositoryContract>(() =>
        _i669.WishlistRepositoryImpl(
            wishlistRemoteDataSource: gh<_i474.WishlistRemoteDataSource>()));
    gh.singleton<_i627.CartScreenCubit>(() => _i627.CartScreenCubit(
          addToCartUseCase: gh<_i956.AddToCartUseCase>(),
          getCartUseCase: gh<_i38.GetCartUseCase>(),
          deleteCartItemUseCase: gh<_i903.DeleteCartItemUseCase>(),
          updateCountCartItemUseCase: gh<_i818.UpdateCountCartItemUseCase>(),
        ));
    gh.singleton<_i427.ProductTabCubit>(() => _i427.ProductTabCubit(
          getProductsUseCase: gh<_i1071.GetProductsUseCase>(),
          getSpecificProductUseCase: gh<_i296.GetSpecificProductUseCase>(),
        ));
    gh.singleton<_i69.LoginCubit>(
        () => _i69.LoginCubit(loginUseCase: gh<_i973.LoginUseCase>()));
    gh.lazySingleton<_i527.AddToWishlistUseCase>(() =>
        _i527.AddToWishlistUseCase(
            wishlistRepositoryContract: gh<_i19.WishlistRepositoryContract>()));
    gh.lazySingleton<_i493.DeleteWishlistItemtUseCase>(() =>
        _i493.DeleteWishlistItemtUseCase(
            wishlistRepositoryContract: gh<_i19.WishlistRepositoryContract>()));
    gh.lazySingleton<_i859.GetWishlistUseCase>(() => _i859.GetWishlistUseCase(
        wishlistRepositoryContract: gh<_i19.WishlistRepositoryContract>()));
    gh.singleton<_i652.WishlistScreenCubit>(() => _i652.WishlistScreenCubit(
          addToWishlistUseCase: gh<_i527.AddToWishlistUseCase>(),
          getWishlistUseCase: gh<_i859.GetWishlistUseCase>(),
          deleteWishlistItemtUseCase: gh<_i493.DeleteWishlistItemtUseCase>(),
        ));
    return this;
  }
}
