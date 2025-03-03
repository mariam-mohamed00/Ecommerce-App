// ignore_for_file: avoid_print

import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/get_cart_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/use_case/add_to_cart_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/delet_cart_item_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_brands_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_cart_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_products_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/update_count_cart_item_use_case.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/screens/favorite_tab.dart';
import 'package:app_e_commerce/features/home/presentation/screens/home_tab.dart';
import 'package:app_e_commerce/features/home/presentation/screens/product_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  GetProductsUseCase getProductsUseCase;
  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  DeleteCartItemUseCase deleteCartItemUseCase;
  UpdateCountCartItemUseCase updateCountCartItemUseCase;

  HomeScreenCubit({
    required this.getCategoriesUseCase,
    required this.getBrandsUseCase,
    required this.getProductsUseCase,
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.deleteCartItemUseCase,
    required this.updateCountCartItemUseCase,
  }) : super(HomeScreenInitialState());

  int selectedIndex = 0;
  int numOfCartItems = 0;

  List<Widget> tabs = [
    const HomeTab(),
    const ProductTab(),
    const FavoriteTab(),
  ];

  List<String> sliderImage = [
    'assets/images/first_pic.png',
    'assets/images/sec_pic.png',
    'assets/images/third_pic.png'
  ];

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];
  List<ProductEntity> productsList = [];
  List<GetProductEntity> getProductList = [];

  void changeBottomNavigationBar(int newSelectedIndex) {
    HomeScreenInitialState();
    selectedIndex = newSelectedIndex;
    emit(ChangeBottomNavigationBar());
  }

  void getCategories() async {
    emit(HomeTabLoadingState(loadingMessage: 'Loading...'));
    var either = await getCategoriesUseCase.invoke();
    either.fold((l) {
      emit(HomeTabErrorState(error: l));
    }, (r) {
      categoriesList = r.dataList ?? [];
      emit(HomeTabSuccessState(categoryOrBrandResponseEntity: r));
    });
  }

  void getBrands() async {
    emit(HomeTabLoadingState(loadingMessage: 'Loading...'));
    var either = await getBrandsUseCase.invoke();
    either.fold((l) {
      emit(HomeTabErrorState(error: l));
    }, (r) {
      brandsList = r.dataList ?? [];
      emit(HomeTabSuccessState(categoryOrBrandResponseEntity: r));
    });
  }

  void getProducts() async {
    emit(ProductTabLoadingState(loadingMessage: 'Loading...'));
    var either = await getProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductTabErrorState(error: l));
    }, (r) {
      productsList = r.dataList ?? [];
      emit(ProductTabSuccessState(productResponseEntity: r));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(loadingMessage: 'Loading...'));
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartErrorState(error: l));
    }, (r) {
      numOfCartItems = r.numOfCartItems?.toInt() ?? 0;
      print('numOfCartItems: $numOfCartItems');
      emit(AddToCartSuccessState(addToCartResponseEntity: r));
    });
  }

  void getCart() async {
    emit(GetCartLoadingState(loadingMessage: 'Loading...'));
    var either = await getCartUseCase.invoke();
    either.fold((l) {
      emit(GetCartErrorState(error: l));
    }, (r) {
      getProductList = r.data?.productsList ?? [];
      emit(GetCartSuccessState(getCartResponseEntity: r));
    });
  }

  void deleteCartItem(String productId) async {
    emit(DeleteCartItemLoadingState(loadingMessage: 'Loading...'));
    var either = await deleteCartItemUseCase.invoke(productId);
    either.fold((l) {
      emit(DeleteCartItemErrorState(error: l));
    }, (r) {
      getProductList = r.data?.productsList ?? [];
      emit(GetCartSuccessState(getCartResponseEntity: r));
    });
  }

  void updateCountCartItem(String productId, int count) async {
    emit(UpdateCountCartItemLoadingState(loadingMessage: 'Loading...'));
    var either = await updateCountCartItemUseCase.invoke(productId, count);
    either.fold((l) {
      emit(UpdateCountCartItemErrorState(error: l));
    }, (r) {
      getProductList = r.data?.productsList ?? [];
      emit(GetCartSuccessState(getCartResponseEntity: r));
    });
  }
}
