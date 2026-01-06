import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';
import 'package:homesta/features/categories/domain/repositories/category_repo.dart';

class SearchCategoryUseCase {
  final CategoryRepo categoryRepo;
  SearchCategoryUseCase(this.categoryRepo);
  Future<Either<ErrorModel, List<CategoryEntity>>> call(String query) =>
      categoryRepo.searCategoty(query);
}
