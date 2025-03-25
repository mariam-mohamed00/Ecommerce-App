import 'package:app_e_commerce/core/di/di.dart';
import 'package:app_e_commerce/core/routing/routes.dart';
import 'package:app_e_commerce/core/theme/my_theme.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:app_e_commerce/features/cart/presentation/cubit/cart_screen_states.dart';
import 'package:app_e_commerce/features/products/presentation/cubit/product_tab_cubit.dart';
import 'package:app_e_commerce/features/products/presentation/cubit/product_tab_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  final ProductTabCubit productTabCubit = ProductTabCubit(
      getProductsUseCase: injectGetProductsUseCase(),
      getSpecificProductUseCase: injectGetSpecificProductUseCase());

  @override
  Widget build(BuildContext context) {
    var productId = ModalRoute.of(context)!.settings.arguments as String;

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
        body: BlocProvider<ProductTabCubit>(
          create: (context) => productTabCubit..getSpecificProduct(productId),
          child: BlocBuilder<ProductTabCubit, ProductTabStates>(
            builder: (context, state) {
              if (state is GetSpesificProductTabSuccessState) {
                var product = state.specificProductResponseEntity.data!;

                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
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
                                      indicatorBackgroundColor:
                                          MyTheme.whiteColor,
                                      indicatorBottomPadding: 20.h,
                                      autoPlayInterval: 3000,
                                      isLoop: true,
                                      children: product.imagesList!
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
                                    product.title ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            color: MyTheme.textColor,
                                            fontWeight: FontWeight.w500),
                                  )),
                                  Text(
                                    'EGP ${product.price ?? 0}',
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
                                        borderRadius:
                                            BorderRadius.circular(100.r),
                                        border: Border.all(
                                            color: MyTheme.mainColor,
                                            width: 1)),
                                    child: Text(
                                      'Sold : ${product.quantity}', //.sold
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
                                    width: 12.w,
                                  ),
                                  Image.asset('assets/icons/star.png'),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    '${product.ratingsAverage}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 18.sp,
                                            color: MyTheme.textColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  BlocBuilder<CartScreenCubit,
                                      CartScreenStates>(
                                    builder: (context, state) {
                                      return Container(
                                        height: 42.h,
                                        width: 122.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: MyTheme.mainColor),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                int counter = BlocProvider.of<
                                                            CartScreenCubit>(
                                                        context)
                                                    .getProductList
                                                    .firstWhere((product) =>
                                                        product.product!.id ==
                                                        productId)
                                                    .count!
                                                    .toInt();
                                                counter--;
                                                BlocProvider.of<
                                                            CartScreenCubit>(
                                                        context)
                                                    .updateCountCartItem(
                                                        BlocProvider.of<CartScreenCubit>(
                                                                    context)
                                                                .getProductList
                                                                .firstWhere((product) =>
                                                                    product
                                                                        .product!
                                                                        .id ==
                                                                    productId)
                                                                .product!
                                                                .id ??
                                                            '',
                                                        counter);
                                              },
                                              child: Icon(
                                                  Icons.remove_circle_outline,
                                                  size: 20,
                                                  color: MyTheme.whiteColor),
                                            ),
                                            Text(
                                              BlocProvider.of<CartScreenCubit>(
                                                      context)
                                                  .getProductList
                                                  .firstWhere((product) =>
                                                      product.product!.id ==
                                                      productId)
                                                  .count
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                int counter = BlocProvider.of<
                                                            CartScreenCubit>(
                                                        context)
                                                    .getProductList
                                                    .firstWhere((product) =>
                                                        product.product!.id ==
                                                        productId)
                                                    .count!
                                                    .toInt();
                                                counter++;
                                                BlocProvider.of<
                                                            CartScreenCubit>(
                                                        context)
                                                    .updateCountCartItem(
                                                        BlocProvider.of<CartScreenCubit>(
                                                                    context)
                                                                .getProductList
                                                                .firstWhere((product) =>
                                                                    product
                                                                        .product!
                                                                        .id ==
                                                                    productId)
                                                                .product!
                                                                .id ??
                                                            '',
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
                                      );
                                    },
                                  )
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
                                product.description ?? '',
                                trimMode: TrimMode.Line,
                                trimLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        color:
                                            MyTheme.mainColor.withOpacity(0.6)),
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
                      Row(children: [
                        Column(
                          children: [
                            Text(
                              'Total price',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontSize: 18.sp,
                                      color: MyTheme.mainColor),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'EGP ${product.price ?? 0}',
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
                          child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<CartScreenCubit>(context)
                                    .addToCart(productId.toString());
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: MyTheme.mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                        )
                      ])
                    ],
                  ),
                );
              }
              return Center(
                  child: CircularProgressIndicator(color: MyTheme.mainColor));
            },
          ),
        ));
  }
}
