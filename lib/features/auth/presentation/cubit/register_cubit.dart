import 'package:app_e_commerce/features/auth/domain/use_case/register_use_case.dart';
import 'package:app_e_commerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:app_e_commerce/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<AuthState> {
  RegisterUseCase registerUseCase;
  RegisterCubit({required this.registerUseCase}) : super(AuthInitial());

  String name = '';
  String email = '';
  String password = '';
  String rePassword = '';
  String mobileNumber = '';

  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  var formKey = GlobalKey<FormState>();

  void onNameChange(String? name) {
    if (name != null && name.trim().isNotEmpty) this.name = name.trim();
    emit(NameOnChanged());
  }

  void onEmailChange(String? email) {
    if (email != null && email.trim().isNotEmpty) {
      this.email = email.trim();
    }
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
    emit(RegisterLoadingState(registerMessage: 'Loading...'));
    var either = await registerUseCase.invoke(
        name, email, password, rePassword, mobileNumber);
    either.fold(
      (l) {
        emit(RegisterErrorState(errorMessage: l.errorMessage));
      },
      (r) {
        emit(RegisterSuccessState(registerResponseEntity: r));
      },
    );
  }
}
