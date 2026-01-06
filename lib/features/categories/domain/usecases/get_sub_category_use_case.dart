import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';
import 'package:homesta/features/categories/domain/repositories/category_repo.dart';

class GetSubCategoryUseCase {
  final CategoryRepo categoryRepo;
  GetSubCategoryUseCase(this.categoryRepo);

  Future<Either<ErrorModel, List<SubCategoryEntity>>> call(int id) =>
      categoryRepo.getSubCategory(id);
}
