import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';

class GetWishlistDataEntity {
  num? sold;
  List<String>? imagesList;
  List<SubcategoryEntity>? subcategoryList;
  num? ratingsQuantity;
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
  num? v;
  String? id;

  GetWishlistDataEntity(
      {this.sold,
      this.imagesList,
      this.subcategoryList,
      this.ratingsQuantity,
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
      this.v,
      this.id});
}

class GetWishlistResponseEntity {
  String? status;
  String? message;
  num? count;
  List<GetWishlistDataEntity>? dataList;

  GetWishlistResponseEntity({this.status, this.count, this.dataList, this.message});
}
