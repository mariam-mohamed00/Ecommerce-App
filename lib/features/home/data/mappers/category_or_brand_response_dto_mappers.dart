import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';

extension CategoryOrBrandDtoMappers on CategoryOrBrandDto {
  CategoryOrBrandEntity toCategoryOrBrandEntity() {
    return CategoryOrBrandEntity(
      id: id,
      name: name,
      image: image,
    );
  }
}

extension CategoryOrBrandResponseDtoMappers on CategoryOrBrandResponseDto {
  CategoryOrBrandResponseEntity toCategoryOrBrandResponseEntity() {
    return CategoryOrBrandResponseEntity(
      results: results,
      dataList: dataList?.map((e) => e.toCategoryOrBrandEntity()).toList(),
    );
  }
}
