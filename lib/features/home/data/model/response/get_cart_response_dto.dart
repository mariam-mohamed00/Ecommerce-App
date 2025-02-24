import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';
import 'package:app_e_commerce/features/home/data/model/response/product_response_dto.dart';

class GetDataDto {
  String? id;
  String? cartOwner;
  List<GetProductDto>? productsList;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? totalCartPrice;

  GetDataDto(
      {this.id,
      this.cartOwner,
      this.productsList,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});

  GetDataDto.fromJson(dynamic json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    if (json["products"] != null) {
      productsList = [];
      json["products"].forEach((v) {
        productsList?.add(GetProductDto.fromJson(v));
      });
    }
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }
}

class GetProductDto {
  String? id;
  num? count;
  GetProductCartDto? product;
  num? price;

  GetProductDto({this.id, this.count, this.product, this.price});

  GetProductDto.fromJson(dynamic json) {
    id = json["_id"];
    count = json["count"];
    product = json["product"] != null
        ? GetProductCartDto.fromJson(json["product"])
        : null;
    price = json["price"];
  }
}

class GetProductCartDto {
  List<SubcategoryDto>? subcategories;
  String? id;
  String? title;
  num? quantity;
  String? imageCover;
  CategoryOrBrandDto? category;
  CategoryOrBrandDto? brand;
  num? ratingsAverage;

  GetProductCartDto(
      {this.subcategories,
      this.id,
      this.title,
      this.quantity,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage});

  GetProductCartDto.fromJson(dynamic json) {
    if (json["subcategories"] != null) {
      subcategories = [];
      json["subcategories"].forEach((v) {
        subcategories?.add(SubcategoryDto.fromJson(v));
      });
    }
    id = json["_id"];
    title = json["title"];
    quantity = json["quantity"];
    imageCover = json["imageCover"];
    category = json["category"] != null
        ? CategoryOrBrandDto.fromJson(json["category"])
        : null;
    brand = json["brand"] != null
        ? CategoryOrBrandDto.fromJson(json["brand"])
        : null;
    ratingsAverage = json["ratingsAverage"];
  }
}

class GetCartResponseDto {
  String? status;
  num? numOfCartItems;
  String? cartId;
  GetDataDto? data;
  String? message;

  GetCartResponseDto(
      {this.status, this.numOfCartItems, this.cartId, this.data, this.message});

  GetCartResponseDto.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    numOfCartItems = json["numOfCartItems"];
    cartId = json["cartId"];
    data = json["data"] != null ? GetDataDto.fromJson(json["data"]) : null;
  }
}
