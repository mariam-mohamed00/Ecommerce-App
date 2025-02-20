// ignore_for_file: avoid_print

import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CategoryOrBrandItem extends StatelessWidget {
  CategoryOrBrandEntity categoryEntity;
  CategoryOrBrandItem({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 6,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: categoryEntity.image ?? '',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: 50.w,
                height: 150.h,
              ),
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            categoryEntity.name ?? '',
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: MyTheme.textColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
        )
      ],
    );
  }
}
