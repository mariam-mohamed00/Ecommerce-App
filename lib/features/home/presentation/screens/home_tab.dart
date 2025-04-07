import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_tab_cubit.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_tab_states.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/announcements_section.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/categories_or_brands_row_widget.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/categories_and_brands_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HomeTab extends StatelessWidget {
  HomeTabCubit homeTabCubit = HomeTabCubit(
      getCategoriesUseCase: injectGetCategoryUseCase(),
      getBrandsUseCase: injectGetBrandsUseCase());
  HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeTabCubit>(
      create: (context) => homeTabCubit
        ..getCategories()
        ..getBrands(),
      child:
          BlocBuilder<HomeTabCubit, HomeTabStates>(builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(Routes.cartScreen);
                      },
                      child: BlocBuilder<CartScreenCubit, CartScreenStates>(
                        builder: (context, state) {
                          return Badge(
                              label: Text(
                                  BlocProvider.of<CartScreenCubit>(context)
                                      .numOfCartItems
                                      .toString()),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: MyTheme.mainColor,
                                size: 28.sp,
                              ));
                        },
                      ),
                    )),
                Text(
                  'View Cart',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: MyTheme.mainColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            AnnouncementsSection(
                images: BlocProvider.of<HomeTabCubit>(context).sliderImage),
            SizedBox(
              height: 16.h,
            ),
            CategoriesOrBrandsRowWidget(
              name: 'Categories',
            ),
            SizedBox(
              height: 24.h,
            ),
            state is HomeTabLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.mainColor,
                    ),
                  )
                : CategoriesAndBrandsSection(
                    list:
                        BlocProvider.of<HomeTabCubit>(context).categoriesList),
            SizedBox(
              height: 24.h,
            ),
            CategoriesOrBrandsRowWidget(
              name: 'Brands',
            ),
            SizedBox(
              height: 20.h,
            ),
            state is HomeTabLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      color: MyTheme.mainColor,
                    ),
                  )
                : CategoriesAndBrandsSection(
                    list: BlocProvider.of<HomeTabCubit>(context).brandsList,
                  ),
            SizedBox(
              height: 24.h,
            ),
          ],
        );
      }),
    );
  }
}
