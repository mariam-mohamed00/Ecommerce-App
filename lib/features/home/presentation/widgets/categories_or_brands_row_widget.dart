import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CategoriesOrBrandsRowWidget extends StatelessWidget {
  CategoriesOrBrandsRowWidget({super.key, required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: MyTheme.textColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                )),
      ],
    );
  }
}
