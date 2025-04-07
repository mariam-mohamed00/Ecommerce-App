import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/home/domain/entity/category_or_brand_response_entity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {
  String? loadingMessage;
  HomeTabLoadingState({required this.loadingMessage});
}

class HomeTabErrorState extends HomeTabStates {
  Failures error;
  HomeTabErrorState({required this.error});
}

class HomeTabSuccessState extends HomeTabStates {
  CategoryOrBrandResponseEntity categoryOrBrandResponseEntity;
  HomeTabSuccessState({required this.categoryOrBrandResponseEntity});
}
