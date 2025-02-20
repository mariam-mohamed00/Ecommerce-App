import 'package:app_e_commerce/features/auth/domain/entity/auth_response_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class NameOnChanged extends AuthState {}

class PhoneOnChanged extends AuthState {}

class RePasswordOnChanged extends AuthState {}

class EmailOnChanged extends AuthState {}

class PasswordOnChanged extends AuthState {}

class LoginLoadingState extends AuthState {
  String loadingMessage;
  LoginLoadingState({required this.loadingMessage});
}

class LoginSuccessState extends AuthState {
  AuthResponseEntity loginResponseEntity;
  LoginSuccessState({required this.loginResponseEntity});
}

class LoginErrorState extends AuthState {
  String errorMessage;

  LoginErrorState({required this.errorMessage});
}

class RegisterLoadingState extends AuthState {
  String registerMessage;
  RegisterLoadingState({required this.registerMessage});
}

class RegisterSuccessState extends AuthState {
  AuthResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterErrorState extends AuthState {
  String errorMessage;

  RegisterErrorState({required this.errorMessage});
}
