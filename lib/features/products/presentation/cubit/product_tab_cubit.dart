import 'package:app_e_commerce/features/products/domain/entity/product_response_entity.dart';
import 'package:app_e_commerce/features/products/domain/use_case/get_products_use_case.dart';
import 'package:app_e_commerce/features/products/presentation/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductTabCubit extends Cubit<ProducTabStates> {
  GetProductsUseCase getProductsUseCase;

  ProductTabCubit({
    required this.getProductsUseCase,
  }) : super(ProductTabInitialState());

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
}
