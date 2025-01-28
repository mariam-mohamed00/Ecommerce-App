import 'package:app_e_commerce/domain/entity/auth_response_entity.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}


class EmailOnChanged extends LoginStates {}

class PasswordOnChanged extends LoginStates{}

class LoginLoadingState extends LoginStates {
  String loadingMessage;
  LoginLoadingState({required this.loadingMessage});
}

class LoginSuccessState extends LoginStates {
  AuthResponseEntity loginResponseEntity;
  LoginSuccessState({required this.loginResponseEntity});
}

class LoginFailedState extends LoginStates {
  String errorMessage;

  LoginFailedState({required this.errorMessage});
}
