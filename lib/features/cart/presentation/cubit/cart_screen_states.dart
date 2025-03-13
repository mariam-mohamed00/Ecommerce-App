import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/cart/domain/entity/add_to_cart_response_entity.dart';
import 'package:app_e_commerce/features/cart/domain/entity/get_cart_response_entity.dart';

abstract class CartScreenStates {}

class CartScreenInitialState extends CartScreenStates {}

class AddToCartLoadingState extends CartScreenStates {
  String? loadingMessage;
  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends CartScreenStates {
  Failures error;
  AddToCartErrorState({required this.error});
}

class AddToCartSuccessState extends CartScreenStates {
  AddToCartResponseEntity addToCartResponseEntity;
  AddToCartSuccessState({required this.addToCartResponseEntity});
}

class GetCartLoadingState extends CartScreenStates {
  String? loadingMessage;
  GetCartLoadingState({required this.loadingMessage});
}

class GetCartErrorState extends CartScreenStates {
  Failures error;
  GetCartErrorState({required this.error});
}

class GetCartSuccessState extends CartScreenStates {
  GetCartResponseEntity getCartResponseEntity;
  GetCartSuccessState({required this.getCartResponseEntity});
}

class DeleteCartItemLoadingState extends CartScreenStates {
  String? loadingMessage;
  DeleteCartItemLoadingState({required this.loadingMessage});
}

class DeleteCartItemErrorState extends CartScreenStates {
  Failures error;
  DeleteCartItemErrorState({required this.error});
}

class DeleteCartItemSuccessState extends CartScreenStates {
  GetCartResponseEntity getCartResponseEntity;
  DeleteCartItemSuccessState({required this.getCartResponseEntity});
}

class UpdateCountCartItemLoadingState extends CartScreenStates {
  String? loadingMessage;
  UpdateCountCartItemLoadingState({required this.loadingMessage});
}

class UpdateCountCartItemErrorState extends CartScreenStates {
  Failures error;
  UpdateCountCartItemErrorState({required this.error});
}

class UpdateCountCartItemSuccessState extends CartScreenStates {
  GetCartResponseEntity getCartResponseEntity;
  UpdateCountCartItemSuccessState({required this.getCartResponseEntity});
}
