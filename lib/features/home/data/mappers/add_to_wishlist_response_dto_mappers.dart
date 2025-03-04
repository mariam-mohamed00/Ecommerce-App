import 'package:app_e_commerce/features/home/data/model/response/add_to_wishlist_response_dto.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_wishlist_response_entity.dart';

extension AddToWishlistResponseDtoMappers on AddToWishlistResponseDto {
  AddToWishlistResponseEntity toAddToWishlistEntity() {
    return AddToWishlistResponseEntity(
        status: status, message: message, dataList: dataList);
  }
}
