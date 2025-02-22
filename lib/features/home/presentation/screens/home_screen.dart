import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/default_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreenCubit homeScreenCubit =
      HomeScreenCubit(getCategoriesUseCase: injectGetCategoryUseCase(), getBrandsUseCase: injectGetBrandsUseCase(), getProductsUseCase: injectGetProductsUseCase());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (context) => homeScreenCubit,
      child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              bottomNavigationBar: defaultBottomNavigationBar(
                  selectedIndex: homeScreenCubit.selectedIndex,
                  onTabFunction: (index) {
                    homeScreenCubit.changeBottomNavigationBar(index);
                  },
                  context: context),
              body: SafeArea(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Image.asset(
                        'assets/images/route.png',
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      homeScreenCubit.tabs[homeScreenCubit.selectedIndex],
                    ])),
              )));
        },
      ),
    );
  }
}
