import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/core/widgets/default_text_form_field.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWithShoppingCar extends StatelessWidget {
  const SearchWithShoppingCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.cartScreen);
            },
            child: BlocBuilder<CartScreenCubit, CartScreenStates>(
              builder: (context, state) {
                return Badge(
                    label: Text(BlocProvider.of<CartScreenCubit>(context)
                        .numOfCartItems
                        .toString()),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: MyTheme.mainColor,
                      size: 28.sp,
                    ));
              },
            ),
          ))
    ]);
  }
}
