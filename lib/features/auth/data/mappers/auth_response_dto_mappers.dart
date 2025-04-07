import 'package:app_e_commerce/features/auth/data/model/response/auth_response_dto.dart';
import 'package:app_e_commerce/features/auth/domain/entity/auth_response_entity.dart';

extension UserDtoMappers on UserDto {
  UserEntity toUserEntity() {
    return UserEntity(name: name, email: email);
  }
}

extension AuthResponseDtoMappers on AuthResponseDto {
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
