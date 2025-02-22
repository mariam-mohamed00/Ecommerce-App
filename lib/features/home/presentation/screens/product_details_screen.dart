import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/home/domain/entity/product_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('Product Details'),
        backgroundColor: Colors.transparent,
        foregroundColor: MyTheme.mainColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20.sp,
            color: MyTheme.textColor,
            fontWeight: FontWeight.bold),
        actions: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.search)),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: MyTheme.mainColor),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: ImageSlideshow(
                    initialPage: 0,
                    indicatorColor: MyTheme.mainColor,
                    indicatorBackgroundColor: MyTheme.whiteColor,
                    indicatorBottomPadding: 20.h,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: args.imagesList!
                        .map((url) => Image.network(
                              url,
                              height: 300.h,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ))
                        .toList(),
                  )),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  args.title ?? '',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18.sp,
                      color: MyTheme.textColor,
                      fontWeight: FontWeight.w500),
                )),
                Text(
                  'EGP ${args.price ?? 0}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 18.sp,
                      color: MyTheme.mainColor,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border:
                              Border.all(color: MyTheme.mainColor, width: 1)),
                      child: Text(
                        'Sold : ${args.sold}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18.sp,
                                color: MyTheme.textColor,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Image.asset('assets/icons/star.png'),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      '${args.ratingsAverage}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18.sp,
                          color: MyTheme.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: MyTheme.mainColor),
                    child: Row(
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_circle_outline_rounded,
                              color: MyTheme.whiteColor,
                              size: 28.sp,
                            )),
                        Text(
                          '${args.quantity}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontSize: 18.sp,
                                  color: MyTheme.whiteColor,
                                  fontWeight: FontWeight.w500),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(Icons.add_circle_outline_rounded,
                              color: MyTheme.whiteColor, size: 28.sp),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 18.sp,
                  color: MyTheme.textColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.h,
            ),
            ReadMoreText(
              args.description ?? '',
              trimMode: TrimMode.Line,
              trimLines: 3,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 14.sp, color: MyTheme.mainColor.withOpacity(0.6)),
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 16.sp,
                  color: MyTheme.textColor,
                  fontWeight: FontWeight.w500),
              lessStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 16.sp,
                  color: MyTheme.textColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 120.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 18.sp, color: MyTheme.mainColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'EGP ${args.price ?? 0}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18.sp,
                          color: MyTheme.mainColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 32.w,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: MyTheme.mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.add_shopping_cart,
                              color: MyTheme.whiteColor,
                            ),
                            Text(
                              'Add to cart',
                              style: Theme.of(context).textTheme.titleMedium,
                            )
                          ],
                        )))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
