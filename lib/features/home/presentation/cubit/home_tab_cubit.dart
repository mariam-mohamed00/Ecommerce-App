import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_brands_use_case.dart';
import 'package:app_e_commerce/features/home/domain/use_case/get_categories_use_case.dart';
import 'package:app_e_commerce/features/home/presentation/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabCubit extends Cubit<HomeTabStates> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;

  HomeTabCubit({
    required this.getCategoriesUseCase,
    required this.getBrandsUseCase,
  }) : super(HomeTabInitialState());

  List<String> sliderImage = [
    'assets/images/first_pic.png',
    'assets/images/sec_pic.png',
    'assets/images/third_pic.png'
  ];

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandsList = [];

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
