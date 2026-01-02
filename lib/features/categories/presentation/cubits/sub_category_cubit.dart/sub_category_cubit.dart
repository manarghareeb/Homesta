import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homesta/features/categories/domain/usecases/get_sub_category_use_case.dart';
import 'package:homesta/features/categories/presentation/cubits/sub_category_cubit.dart/sub_category_state.dart';

class SubCategoryCubit extends Cubit<SubCategoryState> {
final GetSubCategoryUseCase getSubCategoryUseCase;

  SubCategoryCubit({required this.getSubCategoryUseCase}):super(SubCategoryInitial());



  getSubCategories(int id) async {
    emit(SubCategoryLoading());

    final result = await getSubCategoryUseCase(id);

    result.fold(
      (error) {
        emit(SubCategoryFailure(error.errorMessage));
      },
      (categories) {
        emit(SubCategorySuccess(categories));
      },
    );
  }

}
