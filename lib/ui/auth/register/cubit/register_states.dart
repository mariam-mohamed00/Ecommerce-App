import 'package:app_e_commerce/domain/entity/auth_response_entity.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class EmailOnChanged extends RegisterState {}

class PasswordOnChanged extends RegisterState {}

class NameOnChanged extends RegisterState {}

class PhoneOnChanged extends RegisterState {}

class RePasswordOnChanged extends RegisterState {}

class RegisterLoadingState extends RegisterState {
  String loadingMessage;
  RegisterLoadingState({required this.loadingMessage});
}

class RegisterSuccessState extends RegisterState {
  AuthResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterFailedState extends RegisterState {
  String errorMessage;

  RegisterFailedState({required this.errorMessage});
}
