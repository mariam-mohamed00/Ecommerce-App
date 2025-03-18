// ignore_for_file: avoid_print

import 'package:app_e_commerce/features/cart/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/cart/domain/use_case/add_to_cart_use_case.dart';
import 'package:app_e_commerce/features/cart/domain/use_case/delete_cart_item_use_case.dart';
import 'package:app_e_commerce/features/cart/domain/use_case/get_cart_use_case.dart';
import 'package:app_e_commerce/features/cart/domain/use_case/update_count_cart_item_use_case.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreenCubit extends Cubit<CartScreenStates> {
  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  DeleteCartItemUseCase deleteCartItemUseCase;
  UpdateCountCartItemUseCase updateCountCartItemUseCase;

  CartScreenCubit({
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.deleteCartItemUseCase,
    required this.updateCountCartItemUseCase,
  }) : super(CartScreenInitialState()) {
    getCart();
  }

  int numOfCartItems = 0;

  List<GetProductEntity> getProductList = [];

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(loadingMessage: 'Loading...'));
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartErrorState(error: l));
    }, (r) {
      numOfCartItems = r.numOfCartItems?.toInt() ?? 0;
      print('numOfCartItems: $numOfCartItems');
      emit(AddToCartSuccessState(addToCartResponseEntity: r));
    });
  }

  void getCart() async {
    emit(GetCartLoadingState(loadingMessage: 'Loading...'));
    var either = await getCartUseCase.invoke();
    either.fold((l) {
      emit(GetCartErrorState(error: l));
    }, (r) {
      getProductList = r.data?.productsList ?? [];
      numOfCartItems = r.numOfCartItems?.toInt() ?? 0;
      emit(GetCartSuccessState(getCartResponseEntity: r));
    });
  }

  void deleteCartItem(String productId) async {
    emit(DeleteCartItemLoadingState(loadingMessage: 'Loading...'));
    var either = await deleteCartItemUseCase.invoke(productId);
    either.fold((l) {
      emit(DeleteCartItemErrorState(error: l));
    }, (r) {
      getProductList = r.data?.productsList ?? [];
      numOfCartItems = r.numOfCartItems?.toInt() ?? 0;

      emit(GetCartSuccessState(getCartResponseEntity: r));
    });
  }

  void updateCountCartItem(String productId, int count) async {
    emit(UpdateCountCartItemLoadingState(loadingMessage: 'Loading...'));
    var either = await updateCountCartItemUseCase.invoke(productId, count);
    either.fold((l) {
      emit(UpdateCountCartItemErrorState(error: l));
    }, (r) {
      getProductList = r.data?.productsList ?? [];

      emit(GetCartSuccessState(getCartResponseEntity: r));
    });
  }
}
