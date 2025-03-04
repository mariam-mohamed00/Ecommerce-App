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
          if (state is AddToWishlistSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Center(
                    child: Text(
                  'Item added to favorite',
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
                      itemCount: BlocProvider.of<HomeScreenCubit>(context)
                          .productsList
                          .length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 220,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            InkWell(
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
                            ),
                            Positioned(
                                top: 5.h,
                                right: 2.w,
                                child: CircleAvatar(
                                  backgroundColor: MyTheme.whiteColor,
                                  radius: 15,
                                  child: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<HomeScreenCubit>(
                                                context)
                                            .addToWishlist(BlocProvider.of<
                                                            HomeScreenCubit>(
                                                        context)
                                                    .productsList[index]
                                                    .id ??
                                                '');
                                      },
                                      color: MyTheme.mainColor,
                                      padding: EdgeInsets.zero,
                                      icon: BlocProvider.of<HomeScreenCubit>(
                                                  context)
                                              .isWishlisted(BlocProvider.of<
                                                              HomeScreenCubit>(
                                                          context)
                                                      .productsList[index]
                                                      .id ??
                                                  '')
                                          ? const Icon(Icons.favorite_rounded,
                                              color: Colors.red)
                                          : const Icon(
                                              Icons.favorite_border_rounded,
                                            )),
                                ))
                          ],
                        );
                      },
                    ),
                  ),
          ]);
        });
  }
}
