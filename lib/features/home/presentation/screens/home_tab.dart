import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/core/widgets/search_with_shopping_car.dart';
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
      create: (context) => homeTabCubit..getCategories()..getBrands(),
      child: BlocBuilder<HomeTabCubit, HomeTabStates>(
          builder: (context, state) {
            return Column(
              children: [
                const SearchWithShoppingCar(),
                SizedBox(
                  height: 16.h,
                ),
                AnnouncementsSection(
                    images:
                        BlocProvider.of<HomeTabCubit>(context).sliderImage),
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
                        list: BlocProvider.of<HomeTabCubit>(context)
                            .categoriesList),
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
                        list: BlocProvider.of<HomeTabCubit>(context)
                            .brandsList,
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
