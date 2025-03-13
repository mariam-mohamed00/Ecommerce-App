class AddDataDto {
  String? id;
  String? cartOwner;
  List<AddProductsDto>? productsList;
  String? createdAt;
  String? updatedAt;
  num? V;
  num? totalCartPrice;

  AddDataDto(
      {this.id,
      this.cartOwner,
      this.productsList,
      this.createdAt,
      this.updatedAt,
      this.V,
      this.totalCartPrice});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["_id"] = id;
    map["cartOwner"] = cartOwner;
    if (productsList != null) {
      map["products"] = productsList?.map((v) => v.toJson()).toList();
    }
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["__v"] = V;
    map["totalCartPrice"] = totalCartPrice;
    return map;
  }

  AddDataDto.fromJson(dynamic json) {
    id = json["_id"];
    cartOwner = json["cartOwner"];
    if (json["products"] != null) {
      productsList = [];
      json["products"].forEach((v) {
        productsList?.add(AddProductsDto.fromJson(v));
      });
    }
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    V = json["__v"];
    totalCartPrice = json["totalCartPrice"];
  }

}

class AddProductsDto {
  num? count;
  String? id;
  String? product;
  num? price;

  AddProductsDto({this.count, this.id, this.product, this.price});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["count"] = count;
    map["_id"] = id;
    map["product"] = product;
    map["price"] = price;
    return map;
  }

  AddProductsDto.fromJson(dynamic json) {
    count = json["count"];
    id = json["_id"];
    product = json["product"];
    price = json["price"];
  }
}

class AddToCartResponseDto {
  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataDto? data;

  AddToCartResponseDto(
      {this.status, this.message, this.numOfCartItems, this.cartId, this.data});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    map["numOfCartItems"] = numOfCartItems;
    map["cartId"] = cartId;
    if (data != null) {
      map["data"] = data?.toJson();
    }
    return map;
  }

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    numOfCartItems = json["numOfCartItems"];
    cartId = json["cartId"];
    data = json["data"] != null ? AddDataDto.fromJson(json["data"]) : null;
  }
}
