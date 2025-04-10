class RegisterRequest {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  RegisterRequest(
      {this.name, this.email, this.password, this.rePassword, this.phone});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    map["rePassword"] = rePassword;
    map["phone"] = phone;
    return map;
  }

  RegisterRequest.fromJson(dynamic json) {
    name = json["name"];
    email = json["email"];
    password = json["password"];
    rePassword = json["rePassword"];
    phone = json["phone"];
  }
}
