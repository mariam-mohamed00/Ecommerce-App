import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';

class GetDataEntity {
  String? id;
  String? cartOwner;
  List<GetProductEntity>? productsList;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  GetDataEntity(
      {this.id,
      this.cartOwner,
      this.productsList,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});
}

class GetProductEntity {
  String? id;
  num? count;
  GetProductCartEntity? product;
  num? price;

  GetProductEntity({this.id, this.count, this.product, this.price});
}

class GetProductCartEntity {
  List<SubcategoryEntity>? subcategories;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;

  GetProductCartEntity(
      {this.subcategories,
      this.id,
      this.title,
      this.quantity,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage});
}

class GetCartResponseEntity {
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDataEntity? data;

  GetCartResponseEntity(
      {this.status, this.numOfCartItems, this.cartId, this.data});
}
