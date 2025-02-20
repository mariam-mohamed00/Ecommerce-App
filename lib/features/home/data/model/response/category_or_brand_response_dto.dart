class Metadata {
  num? currentPage;
  num? numberOfPages;
  num? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["currentPage"] = currentPage;
    map["numberOfPages"] = numberOfPages;
    map["limit"] = limit;
    return map;
  }

  Metadata.fromJson(dynamic json) {
    currentPage = json["currentPage"];
    numberOfPages = json["numberOfPages"];
    limit = json["limit"];
  }
}

class CategoryOrBrandDto {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryOrBrandDto(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["name"] = name;
    map["slug"] = slug;
    map["image"] = image;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    return map;
  }

  CategoryOrBrandDto.fromJson(dynamic json) {
    id = json["_id"];
    name = json["name"];
    slug = json["slug"];
    image = json["image"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }
}

class CategoryOrBrandResponseDto {
  num? results;
  Metadata? metadata;
  List<CategoryOrBrandDto>? dataList;
  String? message;
  String? statusMsg;

  CategoryOrBrandResponseDto(
      {this.results,
      this.metadata,
      this.dataList,
      this.message,
      this.statusMsg});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["results"] = results;
    map["message"] = message;
    map["statusMsg"] = statusMsg;
    if (metadata != null) {
      map["metadata"] = metadata?.toJson();
    }
    if (dataList != null) {
      map["data"] = dataList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  CategoryOrBrandResponseDto.fromJson(dynamic json) {
    results = json["results"];
    message = json["message"];
    statusMsg = json["statusMsg"];
    metadata =
        json["metadata"] != null ? Metadata.fromJson(json["metadata"]) : null;
    if (json["data"] != null) {
      dataList = [];
      json["data"].forEach((v) {
        dataList?.add(CategoryOrBrandDto.fromJson(v));
      });
    }
  }
}
