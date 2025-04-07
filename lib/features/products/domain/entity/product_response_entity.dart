import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';

class ProductEntity {
  num? sold;
  List<String>? imagesList;
  List<SubcategoryEntity>? subcategoryList;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? priceAfterDiscount;
  List<dynamic>? availableColorsList;

  ProductEntity(
      {this.sold,
      this.imagesList,
      this.subcategoryList,
      this.ratingsQuantity,
      this.id,
      this.title,
      this.slug,
      this.description,
      this.quantity,
      this.price,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.createdAt,
      this.updatedAt,
      this.priceAfterDiscount,
      this.availableColorsList});
}

class SubcategoryEntity {
  String? id;
  String? name;
  String? slug;
  String? category;

  SubcategoryEntity({this.id, this.name, this.slug, this.category});
}

class ProductResponseEntity {
  num? results;
  List<ProductEntity>? dataList;

  ProductResponseEntity({this.results, this.dataList});
}
