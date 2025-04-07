import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/core/routing/app_router.dart';
import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/cubit/my_bloc_observer.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/core/utils/shared_preference.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:app_e_commerce/features/wishlist/presentation/cubit/wishlist_screen_cubit.dart';
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
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<CartScreenCubit>(
        create: (context) => CartScreenCubit(
            addToCartUseCase: injectAddToCartUseCase(),
            getCartUseCase: injectGetCartUseCase(),
            deleteCartItemUseCase: injectDeleteCartItemUseCase(),
            updateCountCartItemUseCase: injectUpdateCountCartItemUseCase()),
      ),
      BlocProvider<WishlistScreenCubit>(
        create: (context) => WishlistScreenCubit(
            getWishlistUseCase: injectGetWishlistUseCase(),
            addToWishlistUseCase: injectAddToWishlistUseCase(),
            deleteWishlistItemtUseCase: injectDeleteWishlistItemtUseCase()),
      ),
    ],
    child: MyApp(route),
  ));
}

// ignore: must_be_immutable
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
