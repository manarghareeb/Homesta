import 'package:dartz/dartz.dart';
import '../../../../core/error/error_model.dart';
import '../../../categories/domain/repositories/category_repo.dart';

class UpdateSubCategoryUseCase {
  final CategoryRepo categoryRepo;
  UpdateSubCategoryUseCase(this.categoryRepo);

  Future<Either<ErrorModel, Unit>> call(int id, String name, String imagePath, double price) {
    return categoryRepo.updateSubCategory(id, name, imagePath, price);
  }
}
