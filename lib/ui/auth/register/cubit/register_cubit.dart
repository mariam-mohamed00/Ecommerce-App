import 'package:app_e_commerce/domain/use_case/register_use_case.dart';
import 'package:app_e_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:app_e_commerce/ui/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterCubit({required this.registerUseCase})
      : super(RegisterInitialState());

  String name = '';
  String email = '';
  String password = '';
  String rePassword = '';
  String mobileNumber = '';

  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  var formKey = GlobalKey<FormState>();

  void onNameChange(String? name) {
    if (name != null) this.name = name;
    emit(NameOnChanged());
  }

  void onEmailChange(String? email) {
    if (email != null) this.email = email;
    emit(EmailOnChanged());
  }

  void onPhoneChange(String? phoneNumber) {
    if (phoneNumber != null) mobileNumber = phoneNumber;
    emit(PhoneOnChanged());
  }

  void onPasswordChange(String? password) {
    if (password != null) this.password = password;
    emit(PasswordOnChanged());
  }

  void onRePasswordChange(String? rePassword) {
    if (rePassword != null) this.rePassword = rePassword;
    emit(RePasswordOnChanged());
  }

  bool isRegisterButtonDisabled() => !(Validator.checkName(name) &&
      Validator.checkEmail(email) &&
      Validator.checkPhone(mobileNumber) &&
      Validator.checkPassword(password) &&
      Validator.checkRePassword(rePassword, password));

  void register() async {
    ///logic
    emit(RegisterLoadingState(loadingMessage: 'Loading...'));
    var either = await registerUseCase.invoke(
        name, email, password, rePassword, mobileNumber);
    either.fold(
      (l) {
        emit(RegisterFailedState(errorMessage: l.errorMessage));
      },
      (r) {
        emit(RegisterSuccessState(registerResponseEntity: r));
      },
    );
  }
}
