import 'package:app_e_commerce/domain/use_case/register_use_case.dart';
import 'package:app_e_commerce/ui/auth/register/cubit/register_states.dart';
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
