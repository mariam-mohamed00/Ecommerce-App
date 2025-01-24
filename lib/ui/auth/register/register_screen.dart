import 'package:app_e_commerce/routing/routes.dart';
import 'package:app_e_commerce/ui/auth/widgets/custom_text_form_field.dart';
import 'package:app_e_commerce/ui/auth/widgets/default_elevation_button.dart';
import 'package:app_e_commerce/ui/auth/widgets/password_text_field.dart';
import 'package:app_e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String mobileNumber = '';

  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.mainColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/route.png',
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Full Name',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomTextFormField(
                        hintText: 'enter your full name',
                        onChanged: (text) {
                          setState(() {
                            if (text != null) name = text;
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
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        'Mobile Number',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomTextFormField(
                        hintText: 'enter your mobile no',
                        onChanged: (text) {
                          setState(() {
                            if (text != null) mobileNumber = text;
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
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        'E-mail address',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomTextFormField(
                          onChanged: (text) {
                            setState(() {
                              if (text != null) email = text;
                            });
                            return null;
                          },
                          textInputType: TextInputType.emailAddress,
                          validator: (text) {
                            if (!emailValid.hasMatch(text!)) {
                              return 'invalid email';
                            }
                            return null;
                          },
                          hintText: 'enter your email address'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PasswordTextFormField(
                        hintText: 'enter your password',
                        onChanged: (text) {
                          setState(() {
                            if (text != null) password = text;
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
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        'Confirmation Password',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PasswordTextFormField(
                        hintText: 'enter your confirmation password',
                        onChanged: (text) {
                          setState(() {
                            if (text != null) confirmPassword = text;
                          });
                          return null;
                        },
                        validator: (text) {
                          if (text != password) {
                            return 'password doesn\'t match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      (name.length >= 3 &&
                              emailValid.hasMatch(email) &&
                              password.length >= 8 &&
                              mobileNumber.length == 11 &&
                              confirmPassword == password)
                          ? DefaultElevatedButton(
                              isDisabled: false,
                              labelColor: MyTheme.textColor,
                              backgroundColor: MyTheme.whiteColor,
                              label: 'Sign Up',
                              onPressed: () {
                                setState(() {});
                                Navigator.of(context)
                                    .pushReplacementNamed(Routes.home);
                              },
                            )
                          : DefaultElevatedButton(
                              isDisabled: true,
                              label: 'Sign Up',
                              onPressed: () {},
                            ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
