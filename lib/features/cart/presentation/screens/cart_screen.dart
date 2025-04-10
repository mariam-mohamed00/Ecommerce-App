// ignore_for_file: use_build_context_synchronously

import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_states.dart';
import 'package:app_e_commerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartScreenCubit, CartScreenStates>(
      listener: (context, state) async {
        if (state is DeleteCartItemLoadingState) {
          await Future.delayed(const Duration(seconds: 2));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Center(
                  child: Text(
                'Item deleted successfully',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              backgroundColor: MyTheme.mainColor,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      bloc: BlocProvider.of<CartScreenCubit>(context)..getCart(),
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: MyTheme.mainColor),
              ),
              title: Text(
                'Cart',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: MyTheme.mainColor),
              ),
            ),
            body: state is GetCartSuccessState
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      Routes.productDetailsScreen,
                                      arguments:
                                          BlocProvider.of<CartScreenCubit>(
                                                  context)
                                              .getProductList[index]
                                              .product!
                                              .id);
                                },
                                child: CartItem(
                                    getProductEntity: state
                                        .getCartResponseEntity
                                        .data!
                                        .productsList![index]),
                              );
                            },
                            itemCount: state
                                .getCartResponseEntity.numOfCartItems!
                                .toInt()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 24.h, left: 16.w, right: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Text('Total Price',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: MyTheme.blackColor
                                              .withOpacity(0.6))),
                            ),
                            Text(
                                'EGP ${state.getCartResponseEntity.data?.totalCartPrice}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: MyTheme.mainColor)),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(color: MyTheme.mainColor),
                  ));
      },
    );
  }
}
