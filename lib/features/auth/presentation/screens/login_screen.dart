import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:app_e_commerce/features/auth/presentation/cubit/login_cubit.dart';
import 'package:app_e_commerce/core/widgets/default_text_form_field.dart';
import 'package:app_e_commerce/core/widgets/default_elevation_button.dart';
import 'package:app_e_commerce/core/widgets/password_text_form_field.dart';
import 'package:app_e_commerce/core/utils/dialog_utils.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit loginCubit = LoginCubit(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => loginCubit,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: MyTheme.mainColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/route.png',
                        height: 200.h,
                        width: 350.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Welcome Back To Route',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Please sign in with your email',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Form(
                        key: loginCubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            Text(
                              'E-mail address',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                                onChanged: loginCubit.onEmailChange,
                                textInputType: TextInputType.emailAddress,
                                validator: (email) {
                                  if (Validator.checkEmail(email)) {
                                    return null;
                                  } else {
                                    return 'invalid email';
                                  }
                                },
                                hintText: 'enter your email address'),
                            SizedBox(
                              height: 30.h,
                            ),
                            Text(
                              'Password',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            PasswordTextFormField(
                              hintText: 'enter your password',
                              validator: (password) {
                                if (Validator.checkPassword(password)) {
                                  return null;
                                }
                                return 'invalid password';
                              },
                              onChanged: loginCubit.onPasswordChange,
                            ),
                            SizedBox(
                              height: 180.h,
                            ),
                            BlocConsumer<LoginCubit, AuthState>(
                              buildWhen: (previous, current) =>
                                  current is EmailOnChanged ||
                                  current is PasswordOnChanged,
                              builder: (context, state) {
                                return DefaultElevatedButton(
                                  labelColor: MyTheme.textColor,
                                  isDisabled:
                                      loginCubit.isLoginButtonDisabled(),
                                  backgroundColor: MyTheme.whiteColor,
                                  label: 'Login',
                                  onPressed: () {
                                    loginCubit.login();
                                  },
                                );
                              },
                              listener: (context, state) {
                                if (state is LoginLoadingState) {
                                  DialogUtils.showLoading(context,
                                      state.loadingMessage, MyTheme.whiteColor);
                                } else if (state is LoginSuccessState) {
                                  DialogUtils.hideLoading(context);
                                  DialogUtils.showMessage(
                                      context,
                                      state.loginResponseEntity.user!.name ??
                                          "Login Successfully",
                                      titleMessage: 'Success',
                                      backgroundColor: MyTheme.mainColor,
                                      textColor: MyTheme.whiteColor,
                                      posActionName: 'OK',
                                      actionColor: MyTheme.whiteColor,
                                      posAction: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.home);
                                  });
                                } else if (state is LoginErrorState) {
                                  DialogUtils.hideLoading(context);
                                  DialogUtils.showMessage(
                                      context, state.errorMessage,
                                      titleMessage: 'Error',
                                      backgroundColor: MyTheme.mainColor,
                                      textColor: MyTheme.whiteColor,
                                      negActionName: 'OK',
                                      actionColor: MyTheme.whiteColor);
                                }
                              },
                            ),
                            SizedBox(height: 40.h),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.registerScreen);
                                },
                                child: Text(
                                  'Don\'t have an account? Create Account',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )),
                          ],
                        ))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
