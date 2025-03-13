import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';
import 'package:app_e_commerce/features/products/data/model/response/product_response_dto.dart';

class GetWishlistDataDto {
  num? sold;
  List<String>? imagesList;
  List<SubcategoryDto>? subcategoryList;
  num? ratingsQuantity;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandDto? category;
  CategoryOrBrandDto? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  num? v;
  String? id;

  GetWishlistDataDto(
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

  GetWishlistDataDto.fromJson(dynamic json) {
    sold = json["sold"];
    imagesList = json["images"] != null ? json["images"].cast<String>() : [];
    if (json["subcategory"] != null) {
      subcategoryList = [];
      json["subcategory"].forEach((v) {
        subcategoryList?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json["ratingsQuantity"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
    category = json["category"] != null
        ? CategoryOrBrandDto.fromJson(json["category"])
        : null;
    brand = json["brand"] != null
        ? CategoryOrBrandDto.fromJson(json["brand"])
        : null;
    ratingsAverage = json["ratingsAverage"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    v = json["__v"];
    id = json["id"];
  }
}

class GetWishlistResponseDto {
  String? status;
  String? message;
  num? count;
  List<GetWishlistDataDto>? dataList;

  GetWishlistResponseDto({this.status, this.count, this.dataList, this.message});

  GetWishlistResponseDto.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    count = json["count"];
    if (json["data"] != null) {
      dataList = [];
      json["data"].forEach((v) {
        dataList?.add(GetWishlistDataDto.fromJson(v));
      });
    }
  }
}
