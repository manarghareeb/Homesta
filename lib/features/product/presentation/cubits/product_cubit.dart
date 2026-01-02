import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/product/domain/usecases/get_all_product_use_case.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProductUseCase getAllProductsUseCase;

  ProductCubit(this.getAllProductsUseCase) : super(ProductInitial());

  Future<void> getAllProducts() async {
    emit(ProductLoading());

    final result = await getAllProductsUseCase();

    result.fold(
      (failure) {
        emit(ProductFailure(failure.errorMessage));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }
}
