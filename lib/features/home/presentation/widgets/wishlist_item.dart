import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_wishlist_response_entity.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class WishlistItem extends StatelessWidget {
  GetWishlistDataEntity getWishlistEntity;
  WishlistItem({super.key, required this.getWishlistEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 12.h, bottom: 12.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border:
              Border.all(width: 1, color: MyTheme.blackColor.withOpacity(0.6)),
        ),
        width: 390.w,
        height: 160.h,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 145.h,
              width: 130.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
              child: Image.network(
                getWishlistEntity.imageCover ?? '',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            getWishlistEntity.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: MyTheme.textColor,
                                    fontWeight: FontWeight.w500),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.favorite_outlined,
                            color: MyTheme.mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EGP ${getWishlistEntity.price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: MyTheme.textColor,
                                  fontWeight: FontWeight.w500),
                        ),
                        Container(
                          height: 42.h,
                          width: 122.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: MyTheme.mainColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<HomeScreenCubit>(context)
                                      .addToCart(getWishlistEntity.id ?? '');
                                },
                                child: Text(
                                  'Add to cart',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
