import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/categories/domain/usecases/get_category_use_case.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoryUseCase getCategoriesUseCase;

  CategoryCubit(this.getCategoriesUseCase) : super(CategoryInitial());

  Future<void> getCategories() async {
    emit(CategoryLoading());

    final result = await getCategoriesUseCase();

    result.fold(
      (error) {
        emit(CategoryFailure(error.errorMessage));
      },
      (categories) {
        emit(CategorySuccess(categories));
      },
    );
  }
}
