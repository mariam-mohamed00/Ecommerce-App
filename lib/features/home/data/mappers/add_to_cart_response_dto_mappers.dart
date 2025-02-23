import 'package:app_e_commerce/features/home/data/model/response/add_to_cart_response_dto.dart';
import 'package:app_e_commerce/features/home/domain/entity/add_to_cart_response_entity.dart';

extension AddProductsDtoMappers on AddProductsDto {
  AddProductsEntity toAddProductsEntity() {
    return AddProductsEntity(
        id: id, count: count, price: price, product: product);
  }
}

extension AddDataDtoMappers on AddDataDto {
  AddDataEntity toAddDataEntity() {
    return AddDataEntity(
      id: id,
      cartOwner: cartOwner,
      createdAt: createdAt,
      updatedAt: updatedAt,
      totalCartPrice: totalCartPrice,
      productsList: productsList?.map((e) => e.toAddProductsEntity()).toList(),
    );
  }
}

extension AddToCartResponseDtoMappers on AddToCartResponseDto {
  AddToCartResponseEntity toAddToCartResponseEntity() {
    return AddToCartResponseEntity(
      status: status,
      message: message,
      cartId: cartId,
      numOfCartItems: numOfCartItems,
      data: data?.toAddDataEntity(),
    );
  }
}
