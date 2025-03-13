import 'package:app_e_commerce/features/cart/data/model/response/get_cart_response_dto.dart';
import 'package:app_e_commerce/features/cart/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/products/data/model/response/product_response_dto.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';

extension GetCartResponseDtoMappers on GetCartResponseDto {
  GetCartResponseEntity toGetCartResponseEntity() {
    return GetCartResponseEntity(
        status: status,
        numOfCartItems: numOfCartItems,
        cartId: cartId,
        data: data?.toGetDataEntity());
  }
}

extension GetDataDtoMappers on GetDataDto {
  GetDataEntity toGetDataEntity() {
    return GetDataEntity(
        cartOwner: cartOwner,
        createdAt: createdAt,
        id: id,
        totalCartPrice: totalCartPrice,
        updatedAt: updatedAt,
        v: v,
        productsList: productsList
            ?.map((product) => product.toGetProductEntity())
            .toList());
  }
}

extension GetProductDtoMappers on GetProductDto {
  GetProductEntity toGetProductEntity() {
    return GetProductEntity(
        id: id,
        price: price,
        count: count,
        product: product?.toGetProductCartEntity());
  }
}

extension GetProductCartDtoMappers on GetProductCartDto {
  GetProductCartEntity toGetProductCartEntity() {
    return GetProductCartEntity(
        id: id,
        imageCover: imageCover,
        quantity: quantity,
        title: title,
        ratingsAverage: ratingsAverage,
        subcategories: subcategories
            ?.map((product) => product.toSubcategoryEntity())
            .toList(),
        brand: toCategoryOrBrandEntity(),
        category: toCategoryOrBrandEntity());
  }
}

extension SubcategoryDtoMappers on SubcategoryDto {
  SubcategoryEntity toSubcategoryEntity() {
    return SubcategoryEntity(
      id: id,
      name: name,
    );
  }
}

extension CategoryOrBrandDtoMappers on GetProductCartDto {
  CategoryOrBrandEntity toCategoryOrBrandEntity() {
    return CategoryOrBrandEntity(
      id: id,
      name: category?.name,
      image: category?.image,
    );
  }
}
