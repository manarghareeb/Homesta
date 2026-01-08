import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/product/domain/usecases/get_products_by_category_use_case%20.dart';
import 'products_by_category_state.dart';

class ProductsByCategoryCubit extends Cubit<ProductsByCategoryState> {
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;

  ProductsByCategoryCubit(this.getProductsByCategoryUseCase)
      : super(ProductsByCategoryInitial());

  void loadProducts({required int categoryId, required int subCategoryId}) async {
    emit(ProductsByCategoryLoading());

    final Either<ErrorModel, List<ProductEntity>> result =
        await getProductsByCategoryUseCase(
            categoryId: categoryId, subCategoryId: subCategoryId);

    result.fold(
      (error) => emit(ProductsByCategoryFailure(error.errorMessage)),
      (products) => emit(ProductsByCategorySuccess(products)),
    );
  }
}
