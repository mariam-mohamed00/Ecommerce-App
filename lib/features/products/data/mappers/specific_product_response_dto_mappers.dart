import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/products/data/model/response/product_response_dto.dart';
import 'package:app_e_commerce/features/products/data/model/response/specific_product_response_dto.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/entity/specific_product_response_entity.dart';

extension SubcategoryDtoMappers on SubcategoryDto {
  SubcategoryEntity toSubcategoryEntity() {
    return SubcategoryEntity(
      id: id,
      name: name,
    );
  }
}

extension CategoryOrBrandDtoMappers on SpecificProductDto {
  CategoryOrBrandEntity toCategoryOrBrandEntity() {
    return CategoryOrBrandEntity(
      id: category?.id,
      name: category?.name,
      image: category?.image,
    );
  }
}

extension SpecificProductDtoMappers on SpecificProductDto {
  SpecificProductEntity toSpecificProductEntity() {
    return SpecificProductEntity(
      sold: sold,
      imagesList: imagesList,
      subcategoryList:
          subcategoryList?.map((e) => e.toSubcategoryEntity()).toList(),
      ratingsQuantity: ratingsQuantity,
      id: id,
      title: title,
      slug: slug,
      description: description,
      quantity: quantity,
      price: price,
      imageCover: imageCover,
      category: toCategoryOrBrandEntity(),
      brand: toCategoryOrBrandEntity(),
      ratingsAverage: ratingsAverage,
      createdAt: createdAt,
      updatedAt: updatedAt,
      reviewsList: reviewsList
    );
  }
}

extension SpecificProductResponseDtoMappers on SpecificProductResponseDto {
  SpecificProductResponseEntity toSpecificProductResponseEntity() {
    return SpecificProductResponseEntity(
      data: data?.toSpecificProductEntity(),
    );
  }
}
