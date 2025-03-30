class AddDataEntity {
  String? id;
  String? cartOwner;
  List<AddProductsEntity>? productsList;
  String? createdAt;
  String? updatedAt;
  num? V;
  num? totalCartPrice;

  AddDataEntity(
      {this.id,
      this.cartOwner,
      this.productsList,
      this.createdAt,
      this.updatedAt,
      this.V,
      this.totalCartPrice});
}

class AddProductsEntity {
  num? count;
  String? id;
  String? product;
  num? price;

  AddProductsEntity({this.count, this.id, this.product, this.price});
}

class AddToCartResponseEntity {
  String? status;
  String? message;
  num? numOfCartItems;
  String? cartId;
  AddDataEntity? data;

  AddToCartResponseEntity(
      {this.status, this.message, this.numOfCartItems, this.cartId, this.data});
}
