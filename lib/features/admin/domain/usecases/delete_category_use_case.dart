import 'package:dartz/dartz.dart';
import '../../../../core/error/error_model.dart';
import '../../../categories/domain/repositories/category_repo.dart';

class DeleteCategoryUseCase {
  final CategoryRepo categoryRepo;
  DeleteCategoryUseCase(this.categoryRepo);

  Future<Either<ErrorModel, Unit>> call(int id) {
    return categoryRepo.deleteCategory(id);
  }
}
