import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/domain/usecases/get_all_product_use_case.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetAllProductUseCase getAllProductsUseCase;
  List<ProductEntity> allProducts = [];

  ProductCubit(this.getAllProductsUseCase) : super(ProductInitial());

  Future<void> getAllProducts() async {
    emit(ProductLoading());

    final result = await getAllProductsUseCase();

    result.fold(
      (failure) {
        emit(ProductFailure(failure.errorMessage));
      },
      (products) {
        allProducts = products;
        emit(ProductSuccess(products));
      },
    );
  }

  void filterProductsByCategories(List<int> categoryIds) {
    if (categoryIds.isEmpty) {
      emit(ProductSuccess(allProducts));
      return;
    }

    final filtered =
        allProducts.where((p) => categoryIds.contains(p.categoryId)).toList();

    emit(ProductSuccess(filtered));
  }

  void getProductsByCategories(List<int> categoryIds) {
    final allProducts =
        state is ProductSuccess
            ? (state as ProductSuccess).products
                .cast<ProductEntity>() 
            : <ProductEntity>[];

    final filtered =
        allProducts.where((p) => categoryIds.contains(p.categoryId)).toList();

    emit(ProductSuccess(filtered));
  }
}
