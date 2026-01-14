import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';
import 'package:homesta/features/categories/domain/usecases/get_sub_category_use_case.dart';
import 'package:homesta/features/categories/domain/usecases/search_sub_category_use_case.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_state.dart';

import '../../../../admin/domain/usecases/add_subCategory_use_case.dart';
import '../../../../admin/domain/usecases/delete_sub_category_use_case.dart';
import '../../../../admin/domain/usecases/update_sub_category_use_case.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
  final AddSubCategoryUseCase addSubCategoryUseCase;
  final GetSubCategoryUseCase getSubCategoryUseCase;
  final DeleteSubCategoryUseCase deleteSubCategoryUseCase;
  final UpdateSubCategoryUseCase updateSubCategoryUseCase;
final SearchSubCategoryUseCase searchSubCategoryUseCase;
  SubCategoryCubit({
    required this.addSubCategoryUseCase,
    required this.getSubCategoryUseCase,
    required this.deleteSubCategoryUseCase,
    required this.updateSubCategoryUseCase, required this.searchSubCategoryUseCase,
  }) : super(SubCategoryInitial());
 List<SubCategoryEntity> subCategories = [];

  getSubCategories(int id) async {
    emit(SubCategoryLoading());

    final result = await getSubCategoryUseCase(id);

    result.fold(
      (error) {
        emit(SubCategoryFailure(error.errorMessage));
      },
      (categories) {
        subCategories=categories;
        emit(SubCategorySuccess(categories));
      },
    );
  }
searchSubcatecory(String query)async
{


emit(SubCategoryLoading());
final result =  searchSubCategoryUseCase(subCategories,query);
emit(SubCategorySuccess(result));




}
  Future<void> addSubCategory(
      int categoryId,
      String name,
      String imagePath,
      double price,
      ) async {
    emit(SubCategoryLoading());

    final result = await addSubCategoryUseCase(categoryId, name, imagePath, price);

    result.fold(
          (error) => emit(SubCategoryFailure(error.errorMessage)),
          (subCategories) async {

        final subCategoriesResult = await getSubCategoryUseCase(categoryId);
        subCategoriesResult.fold(
              (error) => emit(SubCategoryFailure(error.errorMessage)),
              (subCategories) => emit(SubCategorySuccess(subCategories)),
        );
      },
    );
  }

  Future<void> deleteSubCategory(int id, int categoryId) async {
    emit(SubCategoryLoading());
    final result = await deleteSubCategoryUseCase(id);
    result.fold(
          (error) => emit(SubCategoryFailure(error.errorMessage)),
          (_) async {
        final subResult = await getSubCategoryUseCase(categoryId);
        subResult.fold(
              (error) => emit(SubCategoryFailure(error.errorMessage)),
              (subCategories) => emit(SubCategorySuccess(subCategories)),
        );
      },
    );
  }

  Future<void> updateSubCategory(int id, String name, String imagePath, double price, int categoryId) async {
    emit(SubCategoryLoading());
    final result = await updateSubCategoryUseCase(id, name, imagePath, price);
    result.fold(
          (error) => emit(SubCategoryFailure(error.errorMessage)),
          (_) async {
        final subResult = await getSubCategoryUseCase(categoryId);
        subResult.fold(
              (error) => emit(SubCategoryFailure(error.errorMessage)),
              (subCategories) => emit(SubCategorySuccess(subCategories)),
        );
      },
    );
  }
}
