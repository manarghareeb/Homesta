import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/categories/domain/usecases/get_category_use_case.dart';
import 'package:homesta/features/categories/domain/usecases/search_category_use_case.dart';

import '../../../../admin/domain/usecases/add_category_use_case.dart';
import '../../../../admin/domain/usecases/delete_category_use_case.dart';
import '../../../../admin/domain/usecases/update_category_use_case.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoryUseCase getCategoriesUseCase;
  final SearchCategoryUseCase searchCategoryUseCase;
  final AddCategoryUseCase addCategoryUseCase;
  final DeleteCategoryUseCase deleteCategoryUseCase;
  final UpdateCategoryUseCase updateCategoryUseCase;

  CategoryCubit({
    required this.getCategoriesUseCase,
    required this.searchCategoryUseCase,
    required this.addCategoryUseCase,
    required this.deleteCategoryUseCase,
    required this.updateCategoryUseCase,
  }) : super(CategoryInitial());


  Future<void> getCategories() async {
    emit(CategoryLoading());

    final result = await getCategoriesUseCase();

    result.fold(
          (error) => emit(CategoryFailure(error.errorMessage)),
          (categories) => emit(CategorySuccess(categories)),
    );
  }


  Future<void> search(String query) async {
    if (query.isEmpty) {
      await getCategories();
      return;
    }
    emit(CategoryLoading());

    final result = await searchCategoryUseCase(query);

    result.fold(
          (error) => emit(CategoryFailure(error.errorMessage)),
          (categories) => emit(CategorySuccess(categories)),
    );
  }

  Future<void> addCategory(String name, String imagePath) async {
    emit(CategoryLoading());

    final result = await addCategoryUseCase(name, imagePath);

    result.fold(
          (error) => emit(CategoryFailure(error.errorMessage)),
          (_) async {
        final categoriesResult = await getCategoriesUseCase();
        categoriesResult.fold(
              (error) => emit(CategoryFailure(error.errorMessage)),
              (categories) => emit(CategorySuccess(categories)),
        );
      },
    );
  }

  Future<void> deleteCategory(int id) async {
    emit(CategoryLoading());
    final result = await deleteCategoryUseCase(id);
    result.fold(
          (error) => emit(CategoryFailure(error.errorMessage)),
          (_) async {
        final categoriesResult = await getCategoriesUseCase();
        categoriesResult.fold(
              (error) => emit(CategoryFailure(error.errorMessage)),
              (categories) => emit(CategorySuccess(categories)),
        );
      },
    );
  }

  Future<void> updateCategory(int id, String name, String imagePath) async {
    emit(CategoryLoading());
    final result = await updateCategoryUseCase(id, name, imagePath);
    result.fold(
          (error) => emit(CategoryFailure(error.errorMessage)),
          (_) async {
        final categoriesResult = await getCategoriesUseCase();
        categoriesResult.fold(
              (error) => emit(CategoryFailure(error.errorMessage)),
              (categories) => emit(CategorySuccess(categories)),
        );
      },
    );
  }
}
