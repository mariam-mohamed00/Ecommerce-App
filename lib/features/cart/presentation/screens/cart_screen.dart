// ignore_for_file: use_build_context_synchronously

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
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: MyTheme.mainColor),
                ),
              ],
            ),
            body: state is GetCartSuccessState
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              return CartItem(
                                  getProductEntity: state.getCartResponseEntity
                                      .data!.productsList![index]);
                            },
                            itemCount: state
                                .getCartResponseEntity.numOfCartItems!
                                .toInt()),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 24.h, left: 16.w, right: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
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
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 60.h,
                                width: 270.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: MyTheme.mainColor),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(top: 12.h, bottom: 12.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 83.w),
                                        child: Text('Check out',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 27.w, right: 32.w),
                                        child: Icon(Icons.arrow_forward,
                                            size: 20.w,
                                            color: MyTheme.whiteColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
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
