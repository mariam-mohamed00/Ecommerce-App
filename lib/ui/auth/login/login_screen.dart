import 'package:app_e_commerce/routing/routes.dart';
import 'package:app_e_commerce/ui/auth/widgets/custom_text_form_field.dart';
import 'package:app_e_commerce/ui/auth/widgets/default_elevation_button.dart';
import 'package:app_e_commerce/ui/auth/widgets/password_text_field.dart';
import 'package:app_e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  String name = '';
  String password = '';

  RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.mainColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/route.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Text(
                          'User Name',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextFormField(
                          hintText: 'enter your name',
                          textInputType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text!.isEmpty || name.length < 3) {
                              return 'invalid name';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            setState(() {
                              if (text != null) name = text;
                            });
                            return null;
                          },
                        ),
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
                          validator: (text) {
                            if (text!.length < 8) {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onChanged: (text) {
                            setState(() {
                              if (text != null) password = text;
                            });
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text('Forgot Password',
                            textAlign: TextAlign.end,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w400)),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        (name.length >= 3 && password.length >= 8)
                            ? DefaultElevatedButton(
                                labelColor: MyTheme.textColor,
                                isDisabled: false,
                                backgroundColor: MyTheme.whiteColor,
                                label: 'Login',
                                onPressed: () {
                                  setState(() {});
                                  Navigator.of(context)
                                      .pushReplacementNamed(Routes.home);
                                },
                              )
                            : DefaultElevatedButton(
                                isDisabled: true,
                                label: 'Login',
                                onPressed: () {},
                              ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.registerScreen);
                            },
                            child: Text(
                              'Don\'t have an account? Create Account',
                              style: Theme.of(context).textTheme.titleMedium,
                            )),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
