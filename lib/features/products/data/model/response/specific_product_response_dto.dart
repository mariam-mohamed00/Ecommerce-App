import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';
import 'package:app_e_commerce/features/products/data/model/response/product_response_dto.dart';

class SpecificProductDto {
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
  num? V;
  List<dynamic>? reviewsList;
  String? id;

  SpecificProductDto(
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
      this.V,
      this.reviewsList,
      this.id});

  SpecificProductDto.fromJson(dynamic json) {
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
    V = json["__v"];
    if (json["reviews"] != null) {
      reviewsList = [];
    }
    id = json["id"];
  }
}

class SpecificProductResponseDto {
  SpecificProductDto? data;
  String? message;

  SpecificProductResponseDto({this.data, this.message});

  SpecificProductResponseDto.fromJson(dynamic json) {
    message = json["message"];

    data =
        json["data"] != null ? SpecificProductDto.fromJson(json["data"]) : null;
  }
}
