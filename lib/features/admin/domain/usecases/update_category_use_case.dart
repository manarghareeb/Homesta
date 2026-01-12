import 'package:dartz/dartz.dart';
import '../../../../core/error/error_model.dart';
import '../../../categories/domain/repositories/category_repo.dart';

class UpdateCategoryUseCase {
  final CategoryRepo categoryRepo;
  UpdateCategoryUseCase(this.categoryRepo);

  Future<Either<ErrorModel, Unit>> call(int id, String name, String imagePath) {
    return categoryRepo.updateCategory(id, name, imagePath);
  }
}
