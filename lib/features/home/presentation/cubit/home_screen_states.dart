import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';

abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class ChangeBottomNavigationBar extends HomeScreenStates {}

class HomeTabLoadingState extends HomeScreenStates {
  String? loadingMessage;
  HomeTabLoadingState({required this.loadingMessage});
}

class HomeTabErrorState extends HomeScreenStates {
  Failures error;
  HomeTabErrorState({required this.error});
}

class HomeTabSuccessState extends HomeScreenStates {
  CategoryOrBrandResponseEntity categoryOrBrandResponseEntity;
  HomeTabSuccessState({required this.categoryOrBrandResponseEntity});
}
