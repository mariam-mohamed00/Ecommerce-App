import 'package:app_e_commerce/features/home/data/model/response/category_or_brand_response_dto.dart';

class Metadata {
  num? currentPage;
  num? numberOfPages;
  num? limit;
  num? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Metadata.fromJson(dynamic json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
    nextPage = json["nextPage"];
  }
}

class ProductDto {
  num? sold;
  List<String>? imagesList;
  List<SubcategoryDto>? subcategoryList;
  num? ratingsQuantity;
  String? id;
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
  num? priceAfterDiscount;
  List<dynamic>? availableColorsList;

  ProductDto(
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

  ProductDto.fromJson(dynamic json) {
    sold = json["sold"];
    imagesList = json["images"] != null ? json["images"].cast<String>() : [];
    if (json["subcategory"] != null) {
      subcategoryList = [];
      json["subcategory"].forEach((v) {
        subcategoryList?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json["ratingsQuantity"];
    id = json["id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
   
    category = json["category"] != null ? CategoryOrBrandDto.fromJson(json["category"]) : null;
    brand = json["brand"] != null ? CategoryOrBrandDto.fromJson(json["brand"]) : null;
    ratingsAverage = json["ratingsAverage"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    priceAfterDiscount = json["priceAfterDiscount"];
    if (json["availableColors"] != null) {
      availableColorsList = [];
    }
  }
}

class SubcategoryDto {
  String? id;
  String? name;
  String? slug;
  String? category;

  SubcategoryDto({this.id, this.name, this.slug, this.category});

  SubcategoryDto.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    slug = json["slug"];
    category = json["category"];
  }
}

class ProductResponseDto {
  num? results;
  Metadata? metadata;
  List<ProductDto>? dataList;
  String? message;
  String? statusMsg;

  ProductResponseDto({this.results, this.metadata, this.dataList, this.message, this.statusMsg});

  ProductResponseDto.fromJson(dynamic json) {
    results = json["results"];
    message = json["message"];
    statusMsg = json["statusMsg"];
    metadata =
        json["metadata"] != null ? Metadata.fromJson(json["metadata"]) : null;
    if (json["data"] != null) {
      dataList = [];
      json["data"].forEach((v) {
        dataList?.add(ProductDto.fromJson(v));
      });
    }
  }
}
