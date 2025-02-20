import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_brands_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_screen_states.dart';
import 'package:app_e_commerce/features/home/presentation/screens/favorite_tab.dart';
import 'package:app_e_commerce/features/home/presentation/screens/home_tab.dart';
import 'package:app_e_commerce/features/home/presentation/screens/product_tab.dart';
import 'package:app_e_commerce/features/home/presentation/screens/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
  HomeScreenCubit(
      {required this.getCategoriesUseCase, required this.getBrandsUseCase})
      : super(HomeScreenInitialState());

  int selectedIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const ProductTab(),
    const FavoriteTab(),
    const ProfileTab()
  ];

  List<String> sliderImage = [
    'assets/images/first_pic.png',
    'assets/images/sec_pic.png',
    'assets/images/third_pic.png'
  ];

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

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
}
