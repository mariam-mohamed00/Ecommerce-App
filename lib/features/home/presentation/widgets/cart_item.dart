import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CartItem extends StatelessWidget {
  GetProductEntity getProductEntity;
  CartItem({super.key, required this.getProductEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border:
              Border.all(width: 1, color: MyTheme.blackColor.withOpacity(0.6)),
        ),
        width: 398.w,
        height: 165.h,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 145.h,
              width: 130.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
              child: Image.network(
                getProductEntity.product?.imageCover ?? '',
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            getProductEntity.product?.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: MyTheme.mainColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            BlocProvider.of<HomeScreenCubit>(context)
                                .deleteCartItem(
                                    getProductEntity.product!.id ?? '');
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: MyTheme.mainColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                    child: Text(
                      getProductEntity.count.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: MyTheme.textColor),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'EGP ${getProductEntity.price}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: MyTheme.mainColor,
                                  fontWeight: FontWeight.bold),
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
                                  int counter = getProductEntity.count!.toInt();
                                  counter--;
                                  BlocProvider.of<HomeScreenCubit>(context)
                                      .updateCountCartItem(
                                          getProductEntity.product!.id ?? '',
                                          counter);
                                },
                                child: Icon(Icons.remove_circle_outline,
                                    size: 20, color: MyTheme.whiteColor),
                              ),
                              Text(
                                getProductEntity.count.toString(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              InkWell(
                                onTap: () {
                                  int counter = getProductEntity.count!.toInt();
                                  counter++;
                                  BlocProvider.of<HomeScreenCubit>(context)
                                      .updateCountCartItem(
                                          getProductEntity.product!.id ?? '',
                                          counter);
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: MyTheme.whiteColor,
                                  size: 20,
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
            ))
          ],
        ),
      ),
    );
  }
}
