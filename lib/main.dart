// ignore_for_file: must_be_immutable

import 'package:app_e_commerce/core/routing/app_router.dart';
import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/cubit/my_bloc_observer.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/core/utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceUtils.init();
  var user = SharedPreferenceUtils.getData(key: 'Token');
  String route;
  if (user == null) {
    route = Routes.loginScreen;
  } else {
    route = Routes.home;
  }
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(route));
}

class MyApp extends StatelessWidget {
  String route;
  MyApp(this.route, {super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: route,
        onGenerateRoute: AppRouter.generateRoute,
        theme: MyTheme.lightMode,
      ),
    );
  }
}
