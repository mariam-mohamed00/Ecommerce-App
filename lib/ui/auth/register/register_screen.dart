import 'package:app_e_commerce/domain/di.dart';
import 'package:app_e_commerce/routing/routes.dart';
import 'package:app_e_commerce/ui/auth/register/cubit/register_cubit.dart';
import 'package:app_e_commerce/ui/auth/register/cubit/register_states.dart';
import 'package:app_e_commerce/ui/auth/widgets/custom_text_form_field.dart';
import 'package:app_e_commerce/ui/auth/widgets/default_elevation_button.dart';
import 'package:app_e_commerce/ui/auth/widgets/password_text_field.dart';
import 'package:app_e_commerce/ui/utils/dialog_utils.dart';
import 'package:app_e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit registerCubit =
      RegisterCubit(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => registerCubit,
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(
                context, state.loadingMessage, MyTheme.whiteColor);
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, 'Register Successfully',
                titleMessage: 'Success',
                backgroundColor: MyTheme.mainColor,
                textColor: MyTheme.whiteColor,
                posActionName: 'OK',
                actionColor: MyTheme.whiteColor, posAction: () {
              Navigator.pushReplacementNamed(context, Routes.home);
            });
          } else if (state is RegisterFailedState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context, state.errorMessage,
                titleMessage: 'Error',
                backgroundColor: MyTheme.mainColor,
                textColor: MyTheme.whiteColor,
                negActionName: 'OK',
                actionColor: MyTheme.whiteColor);
          }
        },
        child: Scaffold(
          backgroundColor: MyTheme.mainColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/route.png',
                    height: 200.h,
                    width: 350.w,
                  ),
                  Form(
                      key: registerCubit.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Full Name',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextFormField(
                            hintText: 'enter your full name',
                            onChanged: (text) {
                              setState(() {
                                if (text != null) registerCubit.name = text;
                              });
                              return null;
                            },
                            validator: (text) {
                              if (text!.isEmpty || text.length < 3) {
                                return 'invalid name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'Mobile Number',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextFormField(
                            hintText: 'enter your mobile no',
                            onChanged: (text) {
                              setState(() {
                                if (text != null) {
                                  registerCubit.mobileNumber = text;
                                }
                              });
                              return null;
                            },
                            textInputType: TextInputType.phone,
                            validator: (text) {
                              if (text!.isEmpty || text.length < 11) {
                                return 'invalid mobile number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'E-mail address',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextFormField(
                              onChanged: (text) {
                                setState(() {
                                  if (text != null) registerCubit.email = text;
                                });
                                return null;
                              },
                              textInputType: TextInputType.emailAddress,
                              validator: (text) {
                                if (!registerCubit.emailValid.hasMatch(text!)) {
                                  return 'invalid email';
                                }
                                return null;
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
                            onChanged: (text) {
                              setState(() {
                                if (text != null) registerCubit.password = text;
                              });
                              return null;
                            },
                            validator: (text) {
                              if (text!.length < 8) {
                                return 'invalid password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'Confirmation Password',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          PasswordTextFormField(
                            hintText: 'enter your confirmation password',
                            onChanged: (text) {
                              setState(() {
                                if (text != null) {
                                  registerCubit.rePassword = text;
                                }
                              });
                              return null;
                            },
                            validator: (text) {
                              if (text != registerCubit.password) {
                                return 'password doesn\'t match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 60.h,
                          ),
                          (registerCubit.name.length >= 3 &&
                                  registerCubit.emailValid
                                      .hasMatch(registerCubit.email) &&
                                  registerCubit.password.length >= 8 &&
                                  registerCubit.mobileNumber.length == 11 &&
                                  registerCubit.rePassword ==
                                      registerCubit.password)
                              ? DefaultElevatedButton(
                                  isDisabled: false,
                                  labelColor: MyTheme.textColor,
                                  backgroundColor: MyTheme.whiteColor,
                                  label: 'Sign Up',
                                  onPressed: () {
                                    registerCubit.register();
                                  },
                                )
                              : DefaultElevatedButton(
                                  isDisabled: true,
                                  label: 'Sign Up',
                                  onPressed: () {},
                                ),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
