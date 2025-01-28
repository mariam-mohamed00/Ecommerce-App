import 'package:app_e_commerce/domain/entity/auth_response_entity.dart';

class UserDto {
  String? name;
  String? email;
  String? role;

  UserDto({this.name, this.email, this.role});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["name"] = name;
    map["email"] = email;
    map["role"] = role;
    return map;
  }

  UserDto.fromJson(dynamic json) {
    name = json["name"];
    email = json["email"];
    role = json["role"];
  }

  UserEntity toUserEntity() {
    return UserEntity(name: name, email: email);
  }
}

class AuthResponseDto {
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  AuthResponseDto({this.message, this.user, this.token, this.statusMsg});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["message"] = message;
    map["statusMsg"] = statusMsg;
    if (user != null) {
      map["user"] = user?.toJson();
    }
    map["token"] = token;
    return map;
  }

  AuthResponseDto.fromJson(dynamic json) {
    message = json["message"];
    statusMsg = json["statusMsg"];
    user = json["user"] != null ? UserDto.fromJson(json["user"]) : null;
    token = json["token"];
  }

  AuthResponseEntity toRegisterResponseEntity() {
    return AuthResponseEntity(
        token: token,
        user: user?.toUserEntity(),
        message: message,
        statusMsg: statusMsg);
  }

  AuthResponseEntity toLoginResponseEntity() {
    return AuthResponseEntity(
        token: token,
        user: user?.toUserEntity(),
        message: message,
        statusMsg: statusMsg);
  }
}
