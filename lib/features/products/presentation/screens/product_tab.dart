// ignore_for_file: use_build_context_synchronously

import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_states.dart';
import 'package:app_e_commerce/features/products/presentation/cubit/product_tab_cubit.dart';
import 'package:app_e_commerce/features/products/presentation/cubit/product_tab_states.dart';
import 'package:app_e_commerce/features/products/presentation/widgets/grid_view_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/search_with_shopping_car.dart';

class ProductTab extends StatelessWidget {
  ProductTab({super.key});
  final ProductTabCubit productTabCubit = ProductTabCubit(
      getProductsUseCase: injectGetProductsUseCase(),
      getSpecificProductUseCase: injectGetSpecificProductUseCase());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => productTabCubit..getProducts(),
        ),
      ],
      child: BlocListener<CartScreenCubit, CartScreenStates>(
        listener: (context, state) async {
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
        child: BlocBuilder<ProductTabCubit, ProductTabStates>(
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
                      itemCount: BlocProvider.of<ProductTabCubit>(context)
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
                                      BlocProvider.of<ProductTabCubit>(context)
                                          .productsList[index]
                                          .id,
                                );
                              },
                              child: GridViewCartItem(
                                  productEntity:
                                      BlocProvider.of<ProductTabCubit>(context)
                                          .productsList[index]),
                            ),
                            Positioned(
                                top: 5.h,
                                right: 2.w,
                                child: CircleAvatar(
                                  backgroundColor: MyTheme.whiteColor,
                                  radius: 15,
                                  child: IconButton(
                                      onPressed: () {},
                                      color: MyTheme.mainColor,
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(Icons.favorite_rounded,
                                          color: Colors.red)),
                                ))
                          ],
                        );
                      },
                    ),
                  ),
          ]);
        }),
      ),
    );
  }
}
