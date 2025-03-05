import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/search_with_shopping_car.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        bloc: BlocProvider.of<HomeScreenCubit>(context)..getWishlist(),
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
            BlocProvider.of<HomeScreenCubit>(context).getWishlist();
          }
        },
        builder: (context, state) {
          return Column(children: [
            const SearchWithShoppingCar(),
            SizedBox(
              height: 24.h,
            ),
            state is GetWishlistSuccessState
                ?  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              //  Navigator.pushNamed(context, Routes.productDetailsScreen, arguments:   BlocProvider.of<HomeScreenCubit>(context)
                              // .getWishListData[index]);
                            },
                            child: WishlistItem(
                              getWishlistEntity: state
                                  .getWishlistResponseEntity.dataList![index],
                            ),
                          );
                        },
                        itemCount:
                            state.getWishlistResponseEntity.count!.toInt())
                  
                : Center(
                    child: CircularProgressIndicator(color: MyTheme.mainColor),
                  )
          ]);
        });
  }
}
