class DeleteWishlistItemResponseDto {
  String? status;
  String? message;
  List<String>? dataList;

  DeleteWishlistItemResponseDto({this.status, this.message, this.dataList});

  DeleteWishlistItemResponseDto.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    dataList = json["data"] != null ? json["data"].cast<String>() : [];
  }
}
