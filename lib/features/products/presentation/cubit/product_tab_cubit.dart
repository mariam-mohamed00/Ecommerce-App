import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/use_case/get_products_use_case.dart';
import 'package:app_e_commerce/features/products/domain/use_case/get_specific_product_use_case.dart';
import 'package:app_e_commerce/features/products/presentation/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTabCubit extends Cubit<ProductTabStates> {
  GetProductsUseCase getProductsUseCase;
  GetSpecificProductUseCase getSpecificProductUseCase;

  ProductTabCubit(
      {required this.getProductsUseCase,
      required this.getSpecificProductUseCase})
      : super(ProductTabInitialState());

  List<ProductEntity> productsList = [];

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

  void getSpecificProduct(String productId) async {
    emit(GetSpesificProductTabLoadingState(loadingMessage: 'Loading...'));
    var either = await getSpecificProductUseCase.invoke(productId);
    either.fold((l) {
      emit(GetSpesificProductTabErrorState(error: l));
    }, (r) {
      emit(GetSpesificProductTabSuccessState(specificProductResponseEntity: r));
    });
  }
}
