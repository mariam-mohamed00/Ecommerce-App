import 'package:app_e_commerce/domain/entity/register_response_entity.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {
  String loadingMessage;
  RegisterLoadingState({required this.loadingMessage});
}

class RegisterSuccessState extends RegisterState {
  RegisterResponseEntity registerResponseEntity;
  RegisterSuccessState({required this.registerResponseEntity});
}

class RegisterFailedState extends RegisterState {
  String errorMessage;

  RegisterFailedState({required this.errorMessage});
}
