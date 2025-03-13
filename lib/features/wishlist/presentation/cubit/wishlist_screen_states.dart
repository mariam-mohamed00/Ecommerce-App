import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/add_to_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/get_wishlist_response_entity.dart';

abstract class WishlistTabStates {}

class WishlistScreenInitialState extends WishlistTabStates {}

class AddToWishlistLoadingState extends WishlistTabStates {
  String? loadingMessage;
  AddToWishlistLoadingState({required this.loadingMessage});
}

class AddToWishlistErrorState extends WishlistTabStates {
  Failures error;
  AddToWishlistErrorState({required this.error});
}

class AddToWishlistSuccessState extends WishlistTabStates {
  AddToWishlistResponseEntity addToWishlistEntity;
  AddToWishlistSuccessState({required this.addToWishlistEntity});
}

class GetWishlistLoadingState extends WishlistTabStates {
  String? loadingMessage;
  GetWishlistLoadingState({required this.loadingMessage});
}

class GetWishlistErrorState extends WishlistTabStates {
  Failures error;
  GetWishlistErrorState({required this.error});
}

class GetWishlistSuccessState extends WishlistTabStates {
  GetWishlistResponseEntity getWishlistResponseEntity;
  GetWishlistSuccessState({required this.getWishlistResponseEntity});
}

// class DeleteWishlistItemLoadingState extends HomeScreenStates {
//   String? loadingMessage;
//   DeleteWishlistItemLoadingState({required this.loadingMessage});
// }

// class DeleteWishlistItemErrorState extends HomeScreenStates {
//   Failures error;
//   DeleteWishlistItemErrorState({required this.error});
// }

// class DeleteWishlistItemSuccessState extends HomeScreenStates {
//   GetWishlistResponseEntity getWishlistResponseEntity;
//   DeleteWishlistItemSuccessState({required this.getWishlistResponseEntity});
// }