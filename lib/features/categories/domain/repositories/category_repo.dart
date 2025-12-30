import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';

abstract class CategoryRepo {
   Future<Either<ErrorModel, List<CategoryEntity>>> getCategories();
     Future<Either<ErrorModel, List<CategoryEntity>>> searCategoty(String query);
}
