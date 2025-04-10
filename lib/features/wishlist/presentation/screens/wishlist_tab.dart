import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_states.dart';
import 'package:app_e_commerce/features/wishlist/presentation/cubit/wishlist_screen_cubit.dart';
import 'package:app_e_commerce/features/wishlist/presentation/cubit/wishlist_screen_states.dart';
import 'package:app_e_commerce/features/wishlist/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistTab extends StatelessWidget {
  const WishlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartScreenCubit, CartScreenStates>(
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
          BlocProvider.of<WishlistScreenCubit>(context).getWishlist();
        }
      },
      child: BlocConsumer<WishlistScreenCubit, WishlistTabStates>(
        bloc: BlocProvider.of<WishlistScreenCubit>(context)..getWishlist(),
        listener: (context, state) {
          if (state is DeleteWishlistItemSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Center(
                  child: Text(
                'Item removed from wishlist',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              backgroundColor: MyTheme.mainColor,
              duration: const Duration(seconds: 2),
            ));
            BlocProvider.of<WishlistScreenCubit>(context).getWishlist();
          }
        },
        builder: (context, state) {
          return Column(children: [
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
              height: 14.h,
            ),
            Text('Wishlist',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: MyTheme.mainColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600)),
            state is GetWishlistSuccessState
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.productDetailsScreen,
                              arguments:
                                  BlocProvider.of<WishlistScreenCubit>(context)
                                      .getWishListData[index]
                                      .id);
                        },
                        child: WishlistItem(
                          getWishlistEntity:
                              state.getWishlistResponseEntity.dataList![index],
                          onDelete: () {
                            BlocProvider.of<WishlistScreenCubit>(context)
                                .deleteWishlistItem(state
                                    .getWishlistResponseEntity
                                    .dataList![index]
                                    .id!);
                          },
                        ),
                      );
                    },
                    itemCount: state.getWishlistResponseEntity.count!.toInt())
                : Center(
                    child: CircularProgressIndicator(color: MyTheme.mainColor),
                  )
          ]);
        },
      ),
    );
  }
}
