import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';

abstract class ProductScreenStates {}

class ProductScreenInitialState extends ProductScreenStates {}

class ProductTabLoadingState extends ProductScreenStates {
  String? loadingMessage;
  ProductTabLoadingState({required this.loadingMessage});
}

class ProductTabErrorState extends ProductScreenStates {
  Failures error;
  ProductTabErrorState({required this.error});
}

class ProductTabSuccessState extends ProductScreenStates {
  ProductResponseEntity productResponseEntity;
  ProductTabSuccessState({required this.productResponseEntity});
}
