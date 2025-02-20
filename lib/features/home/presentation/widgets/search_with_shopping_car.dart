import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/core/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWithShoppingCar extends StatelessWidget {
  const SearchWithShoppingCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        InkWell(
          onTap: () {},
          child: ImageIcon(
            color: MyTheme.mainColor,
            const AssetImage(
              'assets/images/shopping_icon.png',
            ),
            size: 28.sp,
          ),
        )
      ],
    );
  }
}
