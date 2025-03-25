import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/entity/specific_product_response_entity.dart';

abstract class ProductTabStates {}

class ProductTabInitialState extends ProductTabStates {}

class ProductTabLoadingState extends ProductTabStates {
  String? loadingMessage;
  ProductTabLoadingState({required this.loadingMessage});
}

class ProductTabErrorState extends ProductTabStates {
  Failures error;
  ProductTabErrorState({required this.error});
}

class ProductTabSuccessState extends ProductTabStates {
  ProductResponseEntity productResponseEntity;
  ProductTabSuccessState({required this.productResponseEntity});
}

class GetSpesificProductTabLoadingState extends ProductTabStates {
  String? loadingMessage;
  GetSpesificProductTabLoadingState({required this.loadingMessage});
}

class GetSpesificProductTabErrorState extends ProductTabStates {
  Failures error;
  GetSpesificProductTabErrorState({required this.error});
}

class GetSpesificProductTabSuccessState extends ProductTabStates {
  SpecificProductResponseEntity specificProductResponseEntity;
  GetSpesificProductTabSuccessState(
      {required this.specificProductResponseEntity});
}
