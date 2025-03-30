import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/products/data/model/response/product_response_dto.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';

extension SubcategoryDtoMappers on SubcategoryDto {
  SubcategoryEntity toSubcategoryEntity() {
    return SubcategoryEntity(
      id: id,
      name: name,
    );
  }
}

extension CategoryOrBrandDtoMappers on ProductDto {
  CategoryOrBrandEntity toCategoryOrBrandEntity() {
    return CategoryOrBrandEntity(
      id: category?.id,
      name: category?.name,
      image: category?.image,
    );
  }
}

extension ProductDtoMappers on ProductDto {
  ProductEntity toProductEntity() {
    return ProductEntity(
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
      priceAfterDiscount: priceAfterDiscount,
      availableColorsList: availableColorsList,
    );
  }
}

extension ProductResponseDtoMappers on ProductResponseDto {
  ProductResponseEntity toProductResponseEntity() {
    return ProductResponseEntity(
      results: results,
      dataList: dataList?.map((e) => e.toProductEntity()).toList(),
    );
  }
}
