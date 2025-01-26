import 'package:app_e_commerce/routing/app_router.dart';
import 'package:app_e_commerce/routing/routes.dart';
import 'package:app_e_commerce/ui/utils/my_bloc_observer.dart';
import 'package:app_e_commerce/ui/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
    Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.loginScreen,
        onGenerateRoute: AppRouter.generateRoute,
        theme: MyTheme.lightMode,
      ),
    );
  }
}
