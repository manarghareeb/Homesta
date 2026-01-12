import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/categories/domain/repositories/category_repo.dart';

class AddCategoryUseCase {
  final CategoryRepo categoryRepo;

  AddCategoryUseCase(this.categoryRepo);

  Future<Either<ErrorModel, Unit>> call(String name, String imagePath) {
    return categoryRepo.addCategory(name, imagePath);
  }
}
