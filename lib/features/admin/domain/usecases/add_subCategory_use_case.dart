import 'package:dartz/dartz.dart';
import '../../../../core/error/error_model.dart';
import '../../../categories/domain/repositories/category_repo.dart';

class AddSubCategoryUseCase {
  final CategoryRepo categoryRepo;

  AddSubCategoryUseCase(this.categoryRepo);

  Future<Either<ErrorModel, Unit>> call(int categoryId, String name, String imagePath, double price) {
    return categoryRepo.addSubCategory(categoryId, name, imagePath, price);
  }
}


