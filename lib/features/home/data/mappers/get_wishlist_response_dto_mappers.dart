import 'package:app_e_commerce/features/home/data/model/response/get_wishlist_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/product_response_dto.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/product_response_entity.dart';

extension GetWishlistResponseDtoMappers on GetWishlistResponseDto {
  GetWishlistResponseEntity toGetWishlistResponseEntity() {
    return GetWishlistResponseEntity(
      status: status,
      count: count,
      message: message,
      dataList: dataList
          ?.map((subcategory) => subcategory.toGetWishlistDataEntity())
          .toList(),
    );
  }
}

extension GetWishlistDataDtoMappers on GetWishlistDataDto {
  GetWishlistDataEntity toGetWishlistDataEntity() {
    return GetWishlistDataEntity(
      brand: toCategoryOrBrandEntity(),
      category: toCategoryOrBrandEntity(),
      description: imageCover,
      imageCover: imageCover,
      imagesList: imagesList,
      price: price,
      quantity: quantity,
      ratingsAverage: ratingsAverage,
      ratingsQuantity: ratingsQuantity,
      slug: slug,
      sold: sold,
      title: title,
      subcategoryList: subcategoryList
          ?.map((subcategory) => subcategory.toSubcategoryEntity())
          .toList(),
      createdAt: createdAt,
      id: id,
      updatedAt: updatedAt,
      v: v,
    );
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

extension CategoryOrBrandDtoMappers on GetWishlistDataDto {
  CategoryOrBrandEntity toCategoryOrBrandEntity() {
    return CategoryOrBrandEntity(
      id: id,
      name: category?.name,
      image: category?.image,
    );
  }
}
