import 'package:dartz/dartz.dart';
import '../../../../core/error/error_model.dart';
import '../../../categories/domain/repositories/category_repo.dart';

class DeleteSubCategoryUseCase {
  final CategoryRepo categoryRepo;
  DeleteSubCategoryUseCase(this.categoryRepo);

  Future<Either<ErrorModel, Unit>> call(int id) {
    return categoryRepo.deleteSubCategory(id);
  }
}




