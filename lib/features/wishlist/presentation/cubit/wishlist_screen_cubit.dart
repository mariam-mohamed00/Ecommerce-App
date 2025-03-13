// ignore_for_file: avoid_print

import 'package:app_e_commerce/features/wishlist/domain/entity/get_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/wishlist/domain/use_case/add_to_wishlist_use_case.dart';
import 'package:app_e_commerce/features/wishlist/domain/use_case/get_wishlist_use_case.dart';
import 'package:app_e_commerce/features/wishlist/presentation/cubit/wishlist_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreenCubit extends Cubit<WishlistTabStates> {
  AddToWishlistUseCase addToWishlistUseCase;
  GetWishlistUseCase getWishlistUseCase;
  // DeleteWishlistItemtUseCase deleteWishlistItemtUseCase;

  WishlistScreenCubit({
    required this.addToWishlistUseCase,
    required this.getWishlistUseCase,
    // required this.deleteWishlistItemtUseCase
  }) : super(WishlistScreenInitialState());

  List<String> wishList = [];
  List<GetWishlistDataEntity> getWishListData = [];

  void addToWishlist(String productId) async {
    emit(AddToWishlistLoadingState(loadingMessage: 'Loading...'));
    var either = await addToWishlistUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToWishlistErrorState(error: l));
    }, (r) {
      if (wishList.contains(productId)) {
        wishList.remove(productId);
      } else {
        wishList.add(productId);
      }
      emit(AddToWishlistSuccessState(addToWishlistEntity: r));
    });
  }

  bool isWishlisted(String productId) {
    return wishList.contains(productId);
  }

  void getWishlist() async {
    emit(GetWishlistLoadingState(loadingMessage: 'Loading...'));
    var either = await getWishlistUseCase.invoke();
    either.fold((l) {
      emit(GetWishlistErrorState(error: l));
    }, (r) {
      getWishListData = r.dataList ?? [];
      emit(GetWishlistSuccessState(getWishlistResponseEntity: r));
    });
  }

  // void deleteWishlistItem(String productId) async {
  //   emit(DeleteWishlistItemLoadingState(loadingMessage: 'Loading...'));
  //   var either = await deleteWishlistItemtUseCase.invoke(productId);
  //   either.fold((l) {
  //     emit(DeleteWishlistItemErrorState(error: l));
  //   }, (r) {
  //     getWishListData = r.dataList ?? [];
  //     emit(DeleteWishlistItemSuccessState(getWishlistResponseEntity: r));
  //   });
  // }
}
