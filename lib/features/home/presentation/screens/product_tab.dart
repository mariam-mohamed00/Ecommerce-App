import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/grid_view_cart_item.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/search_with_shopping_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        bloc: BlocProvider.of<HomeScreenCubit>(context)..getProducts(),
        listener: (context, state) {
          if (state is AddToCartSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Center(
                    child: Text(
                  'Item added to cart',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                backgroundColor: MyTheme.mainColor,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(children: [
            const SearchWithShoppingCar(),
            SizedBox(
              height: 24.h,
            ),
            state is ProductTabLoadingState
                ? Center(
                    child: CircularProgressIndicator(color: MyTheme.mainColor),
                  )
                : SizedBox(
                    height: 600,
                    child: GridView.builder(
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: BlocProvider.of<HomeScreenCubit>(context)
                          .productsList
                          .length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 220,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h),
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              Routes.productDetailsScreen,
                              arguments:
                                  BlocProvider.of<HomeScreenCubit>(context)
                                      .productsList[index],
                            );
                          },
                          child: GridViewCartItem(
                              productEntity:
                                  BlocProvider.of<HomeScreenCubit>(context)
                                      .productsList[index]),
                        );
                      },
                    ),
                  ),
          ]);
        });
  }
}
