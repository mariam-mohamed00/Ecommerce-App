import 'package:app_e_commerce/domain/use_case/login_use_case.dart';
import 'package:app_e_commerce/ui/auth/login/cubit/login_states.dart';
import 'package:app_e_commerce/ui/utils/validator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;
  LoginCubit({required this.loginUseCase}) : super(LoginInitialState());

  var formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  void onEmailChange(String? email) {
    if (email != null) this.email = email;
    emit(EmailOnChanged());
  }

  void onPasswordChange(String? password) {
    if (password != null) this.password = password;
    emit(PasswordOnChanged());
  }

  bool isLoginButtonDisabled() =>
      !(Validator.checkEmail(email) && Validator.checkPassword(password));

  void login() async {
    ///logic
    emit(LoginLoadingState(loadingMessage: 'Loading...'));
    var either = await loginUseCase.invoke(email, password);
    either.fold(
      (l) {
        emit(LoginFailedState(errorMessage: l.errorMessage));
      },
      (r) {
        emit(LoginSuccessState(loginResponseEntity: r));
      },
    );
  }
}
