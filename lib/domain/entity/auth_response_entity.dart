class UserEntity {
  String? name;
  String? email;

  UserEntity({this.name, this.email});
}

class AuthResponseEntity {
  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;
  AuthResponseEntity({this.message, this.user, this.token, this.statusMsg});
}
