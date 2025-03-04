import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/product_response_entity.dart';

abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class ChangeBottomNavigationBar extends HomeScreenStates {}

class HomeTabLoadingState extends HomeScreenStates {
  String? loadingMessage;
  HomeTabLoadingState({required this.loadingMessage});
}

class HomeTabErrorState extends HomeScreenStates {
  Failures error;
  HomeTabErrorState({required this.error});
}

class HomeTabSuccessState extends HomeScreenStates {
  CategoryOrBrandResponseEntity categoryOrBrandResponseEntity;
  HomeTabSuccessState({required this.categoryOrBrandResponseEntity});
}

class ProductTabLoadingState extends HomeScreenStates {
  String? loadingMessage;
  ProductTabLoadingState({required this.loadingMessage});
}

class ProductTabErrorState extends HomeScreenStates {
  Failures error;
  ProductTabErrorState({required this.error});
}

class ProductTabSuccessState extends HomeScreenStates {
  ProductResponseEntity productResponseEntity;
  ProductTabSuccessState({required this.productResponseEntity});
}

class SearchProductTabLoadingState extends HomeScreenStates {
  String? loadingMessage;
  SearchProductTabLoadingState({required this.loadingMessage});
}

class SearchProductTabErrorState extends HomeScreenStates {
  Failures error;
  SearchProductTabErrorState({required this.error});
}

class SearchProductTabSuccessState extends HomeScreenStates {
  ProductResponseEntity productResponseEntity;
  SearchProductTabSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends HomeScreenStates {
  String? loadingMessage;
  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends HomeScreenStates {
  Failures error;
  AddToCartErrorState({required this.error});
}

class AddToCartSuccessState extends HomeScreenStates {
  AddToCartResponseEntity addToCartResponseEntity;
  AddToCartSuccessState({required this.addToCartResponseEntity});
}

class GetCartLoadingState extends HomeScreenStates {
  String? loadingMessage;
  GetCartLoadingState({required this.loadingMessage});
}

class GetCartErrorState extends HomeScreenStates {
  Failures error;
  GetCartErrorState({required this.error});
}

class GetCartSuccessState extends HomeScreenStates {
  GetCartResponseEntity getCartResponseEntity;
  GetCartSuccessState({required this.getCartResponseEntity});
}

class DeleteCartItemLoadingState extends HomeScreenStates {
  String? loadingMessage;
  DeleteCartItemLoadingState({required this.loadingMessage});
}

class DeleteCartItemErrorState extends HomeScreenStates {
  Failures error;
  DeleteCartItemErrorState({required this.error});
}

class DeleteCartItemSuccessState extends HomeScreenStates {
  GetCartResponseEntity getCartResponseEntity;
  DeleteCartItemSuccessState({required this.getCartResponseEntity});
}

class UpdateCountCartItemLoadingState extends HomeScreenStates {
  String? loadingMessage;
  UpdateCountCartItemLoadingState({required this.loadingMessage});
}

class UpdateCountCartItemErrorState extends HomeScreenStates {
  Failures error;
  UpdateCountCartItemErrorState({required this.error});
}

class UpdateCountCartItemSuccessState extends HomeScreenStates {
  GetCartResponseEntity getCartResponseEntity;
  UpdateCountCartItemSuccessState({required this.getCartResponseEntity});
}

class AddToWishlistLoadingState extends HomeScreenStates {
  String? loadingMessage;
  AddToWishlistLoadingState({required this.loadingMessage});
}

class AddToWishlistErrorState extends HomeScreenStates {
  Failures error;
  AddToWishlistErrorState({required this.error});
}

class AddToWishlistSuccessState extends HomeScreenStates {
  AddToWishlistResponseEntity addToWishlistEntity;
  AddToWishlistSuccessState({required this.addToWishlistEntity});
}
