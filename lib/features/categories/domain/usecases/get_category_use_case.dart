import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';
import 'package:homesta/features/categories/domain/repositories/category_repo.dart';

class GetCategoryUseCase {
  final CategoryRepo categoryRepo;

  GetCategoryUseCase(this.categoryRepo);

  Future<Either<ErrorModel, List<CategoryEntity>>> call() =>
      categoryRepo.getCategories();
}
