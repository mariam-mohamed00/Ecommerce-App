import 'package:app_e_commerce/features/wishlist/data/model/response/delete_wishlist_item_response_dto.dart';
import 'package:app_e_commerce/features/wishlist/domain/entity/delete_wishlist_item_response_entity.dart';

extension DeleteWishlistItemResponseDtoMappers on DeleteWishlistItemResponseDto {
  DeleteWishlistItemResponseEntity toDeleteWishlistItemResponseEntity() {
    return DeleteWishlistItemResponseEntity(
        status: status, message: message, dataList: dataList);
  }
}
