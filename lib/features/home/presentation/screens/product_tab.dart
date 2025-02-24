import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/core/widgets/default_text_form_field.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/grid_view_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatelessWidget {
  const ProductTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
        bloc: BlocProvider.of<HomeScreenCubit>(context)..getProducts(),
        builder: (context, state) {
          return Column(children: [
            Row(
              children: [
                Expanded(
                    child: DefaultTextFormField(
                  hintText: 'What do you search for?',
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 32.sp,
                        color: MyTheme.mainColor.withOpacity(0.75),
                      )),
                )),
                SizedBox(
                  width: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Badge(
                      label: Text(
                        BlocProvider.of<HomeScreenCubit>(context)
                          .numOfCartItems
                          .toString()
                          ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.cartScreen);
                        },
                        child: ImageIcon(
                          color: MyTheme.mainColor,
                          const AssetImage(
                            'assets/icons/shopping.png',
                          ),
                          size: 28.sp,
                        ),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            state is ProductTabLoadingState
                ? Center(
                    child: CircularProgressIndicator(color: MyTheme.mainColor),
                  )
                : SizedBox(
                    height: 650.h,
                    child: GridView.builder(
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: BlocProvider.of<HomeScreenCubit>(context)
                          .productsList
                          .length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.4,
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
                                        .productsList[index]);
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
