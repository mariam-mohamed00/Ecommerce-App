import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/home/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_cubit.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  HomeScreenCubit homeScreenCubit = HomeScreenCubit(
      getCategoriesUseCase: injectGetCategoryUseCase(),
      getBrandsUseCase: injectGetBrandsUseCase(),
      getProductsUseCase: injectGetProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase(),
      getCartUseCase: injectGetCartUseCase(),
      deleteCartItemUseCase: injectDeleteCartItemUseCase(),
      updateCountCartItemUseCase: injectUpdateCountCartItemUseCase(),
      addToWishlistUseCase: injectAddToWishlistUseCase(),
      getWishlistUseCase: injectGetWishlistUseCase(),
      deleteWishlistItemtUseCase: injectDeleteWishlistItemtUseCase());

  ProductDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ProductEntity;

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
              onPressed: () {
                Navigator.pushNamed(context, Routes.cartScreen);
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: BlocProvider<HomeScreenCubit>(
        create: (context) => homeScreenCubit,
        child: BlocBuilder<HomeScreenCubit, HomeScreenStates>(
            builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        color: MyTheme.textColor,
                                        fontWeight: FontWeight.w500),
                              )),
                              Text(
                                'EGP ${args.price ?? 0}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
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
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.h, horizontal: 16.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    border: Border.all(
                                        color: MyTheme.mainColor, width: 1)),
                                child: Text(
                                  'Sold : ${args.quantity}', //.sold
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 18.sp,
                                          color: MyTheme.textColor,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Spacer(),
                              Image.asset('assets/icons/star.png'),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                '${args.ratingsAverage}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontSize: 18.sp,
                                        color: MyTheme.textColor,
                                        fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            'Description',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
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
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 14.sp,
                                    color: MyTheme.mainColor.withOpacity(0.6)),
                            colorClickableText: Colors.pink,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 16.sp,
                                    color: MyTheme.textColor,
                                    fontWeight: FontWeight.w500),
                            lessStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontSize: 16.sp,
                                    color: MyTheme.textColor,
                                    fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
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
                                .copyWith(
                                    fontSize: 18.sp, color: MyTheme.mainColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'EGP ${args.price ?? 0}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
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
                          child:
                              BlocListener<HomeScreenCubit, HomeScreenStates>(
                        listener: (context, state) {
                          if (state is AddToCartSuccessState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Center(
                                    child: Text(
                                  'Item added to cart',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                                backgroundColor: MyTheme.mainColor,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<HomeScreenCubit>(context)
                                  .addToCart(args.id ?? '');
                            },
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
                                  Icons.shopping_cart_outlined,
                                  color: MyTheme.whiteColor,
                                ),
                                Text(
                                  'Add to cart',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                )
                              ],
                            )),
                      ))
                    ],
                  )
                ]),
          );
        }),
      ),
    );
  }
}
