// ignore_for_file: use_build_context_synchronously

import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_states.dart';
import 'package:app_e_commerce/features/products/presentation/cubit/product_tab_cubit.dart';
import 'package:app_e_commerce/features/products/presentation/cubit/product_tab_states.dart';
import 'package:app_e_commerce/features/products/presentation/widgets/grid_view_cart_item.dart';
import 'package:app_e_commerce/features/wishlist/presentation/cubit/wishlist_screen_cubit.dart';
import 'package:app_e_commerce/features/wishlist/presentation/cubit/wishlist_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/search_with_shopping_car.dart';

class ProductTab extends StatefulWidget {
  const ProductTab({super.key});

  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> {
  final ProductTabCubit productTabCubit = ProductTabCubit(
      getProductsUseCase: injectGetProductsUseCase(),
      getSpecificProductUseCase: injectGetSpecificProductUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductTabCubit>(
      create: (context) => productTabCubit..getProducts(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<WishlistScreenCubit, WishlistTabStates>(
              listener: (context, state) {
            if (state is AddToWishlistSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Center(
                      child: Text(
                    'Item added to wishlist',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  backgroundColor: MyTheme.mainColor,
                  duration: const Duration(seconds: 2),
                ),
              );
              BlocProvider.of<WishlistScreenCubit>(context).getWishlist();
            }
          }),
          BlocListener<WishlistScreenCubit, WishlistTabStates>(
              listener: (context, state) {
            if (state is DeleteWishlistItemSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Center(
                      child: Text(
                    'Item removed from wishlist',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  backgroundColor: MyTheme.mainColor,
                  duration: const Duration(seconds: 2),
                ),
              );
              BlocProvider.of<WishlistScreenCubit>(context).getWishlist();
            }
          }),
          BlocListener<CartScreenCubit, CartScreenStates>(
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
          }),
          BlocListener<CartScreenCubit, CartScreenStates>(
            listener: (context, state) async {
              if (state is UpdateCountCartItemLoadingState) {
                await Future.delayed(const Duration(seconds: 2));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Center(
                        child: Text(
                      'Item updated successfully',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    backgroundColor: MyTheme.mainColor,
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
          )
        ],
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
                                  child: BlocBuilder<WishlistScreenCubit,
                                          WishlistTabStates>(
                                      builder: (context, state) {
                                    // ignore: avoid_print
                                    print(BlocProvider.of<WishlistScreenCubit>(
                                            context)
                                        .wishList);
                                    final isWishlisted = BlocProvider.of<
                                            WishlistScreenCubit>(context)
                                        .isWishlisted(
                                            BlocProvider.of<ProductTabCubit>(
                                                        context)
                                                    .productsList[index]
                                                    .id ??
                                                '');
                                    return IconButton(
                                      onPressed: () {
                                        !isWishlisted
                                            ? BlocProvider.of<
                                                        WishlistScreenCubit>(
                                                    context)
                                                .addToWishlist(BlocProvider.of<
                                                                ProductTabCubit>(
                                                            context)
                                                        .productsList[index]
                                                        .id ??
                                                    '')
                                            : BlocProvider.of<
                                                        WishlistScreenCubit>(
                                                    context)
                                                .deleteWishlistItem(BlocProvider
                                                            .of<ProductTabCubit>(
                                                                context)
                                                        .productsList[index]
                                                        .id ??
                                                    '');
                                      },
                                      color: MyTheme.mainColor,
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        isWishlisted
                                            ? Icons.favorite_rounded
                                            : Icons.favorite_border_rounded,
                                        color: isWishlisted ? Colors.red : null,
                                      ),
                                    );
                                  }),
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
