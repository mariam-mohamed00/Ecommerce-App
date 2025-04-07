import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/home/presentation/widgets/category_or_brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CategoriesAndBrandsSection extends StatelessWidget {
  CategoriesAndBrandsSection({super.key, required this.list});
  List<CategoryOrBrandEntity> list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: GridView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
        itemBuilder: (context, index) {
          return CategoryOrBrandItem(
            categoryEntity: list[index],
          );
        },
      ),
    );
  }
}
