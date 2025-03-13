import 'package:app_e_commerce/core/errors/failures.dart';
import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';

abstract class ProducTabStates {}

class ProductTabInitialState extends ProducTabStates {}

class ProductTabLoadingState extends ProducTabStates {
  String? loadingMessage;
  ProductTabLoadingState({required this.loadingMessage});
}

class ProductTabErrorState extends ProducTabStates {
  Failures error;
  ProductTabErrorState({required this.error});
}

class ProductTabSuccessState extends ProducTabStates {
  ProductResponseEntity productResponseEntity;
  ProductTabSuccessState({required this.productResponseEntity});
}
