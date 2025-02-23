import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/home/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// ignore: must_be_immutable
class GridViewCartItem extends StatelessWidget {
  bool isWishListed = false;
 ProductEntity productEntity;
  GridViewCartItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: MyTheme.mainColor, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  productEntity.imageCover ?? '',
                  width: 180.w,
                  height: 160.h,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: MyTheme.whiteColor,
                    radius: 15,
                    child: IconButton(
                        onPressed: () {
                          // isWishListed = !isWishListed;
                          // setState(() {});
                        },
                        color: MyTheme.mainColor,
                        padding: EdgeInsets.zero,
                        icon: isWishListed == true
                            ? const Icon(Icons.favorite_rounded,
                                color: Colors.red)
                            : const Icon(
                                Icons.favorite_border_rounded,
                              )),
                  ))
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(productEntity.title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: MyTheme.textColor,
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  Text('EGP ${productEntity.price}',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.sp,
                          color: MyTheme.textColor,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              )),
          const Spacer(flex: 1),
          Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Row(
                children: [
                  Text('Review (${productEntity.ratingsAverage})',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.sp,
                          color: MyTheme.textColor,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    width: 7.w,
                  ),
                  Image.asset('assets/icons/star.png'),
                  const Spacer(flex: 1),
                  InkWell(
                      onTap: () {
                        BlocProvider.of<HomeScreenCubit>(context).addToCart(productEntity.id ?? '');
                      },
                      splashColor: Colors.transparent,
                      child: Icon(
                        Icons.add_circle,
                        size: 32.sp,
                        color: MyTheme.mainColor,
                      ))
                ],
              )),
          SizedBox(
            height: 7.h,
          ),
        ],
      ),
    );
  }
}
