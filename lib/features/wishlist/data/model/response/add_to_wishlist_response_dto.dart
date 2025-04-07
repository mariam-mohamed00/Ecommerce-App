class AddToWishlistResponseDto {
  String? status;
  String? message;
  List<String>? dataList;

  AddToWishlistResponseDto({this.status, this.message, this.dataList});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["status"] = status;
    map["message"] = message;
    map["data"] = dataList;
    return map;
  }

  AddToWishlistResponseDto.fromJson(dynamic json) {
    status = json["status"];
    message = json["message"];
    dataList = json["data"] != null ? json["data"].cast<String>() : [];
  }
}
