import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  HomeScreenCubit homeScreenCubit = HomeScreenCubit(
      getCategoriesUseCase: injectGetCategoryUseCase(),
      getBrandsUseCase: injectGetBrandsUseCase(),
      getProductsUseCase: injectGetProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
      getCartUseCase: injectGetCartUseCase(),
      deleteCartItemUseCase: injectDeleteCartItemUseCase(),
      updateCountCartItemUseCase: injectUpdateCountCartItemUseCase(),
      addToWishlistUseCase: injectAddToWishlistUseCase(),
      getWishlistUseCase: injectGetWishlistUseCase(),
      deleteWishlistItemtUseCase: injectDeleteWishlistItemtUseCase());
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (context) => homeScreenCubit..getCart(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenStates>(
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
                    onPressed: () {
                      // Button logic here
                    },
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
                                    getProductEntity: state
                                        .getCartResponseEntity
                                        .data!
                                        .productsList![index]);
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
                                onTap: () {
                                  //logic here
                                },
                                child: Container(
                                  height: 60.h,
                                  width: 270.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: MyTheme.mainColor),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 12.h, bottom: 12.h),
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
                      child:
                          CircularProgressIndicator(color: MyTheme.mainColor),
                    ));
        },
      ),
    );
  }
}
