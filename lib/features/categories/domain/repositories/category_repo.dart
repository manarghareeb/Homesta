import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';
import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';

abstract class CategoryRepo {
  Future<Either<ErrorModel, List<CategoryEntity>>> getCategories();
  Future<Either<ErrorModel, List<CategoryEntity>>> searCategoty(String query);
  Future<Either<ErrorModel, Unit>> addCategory(String name, String imagePath);
  Future<Either<ErrorModel, Unit>> deleteCategory(int id);
  Future<Either<ErrorModel, Unit>> updateCategory(int id, String name, String imagePath);
  Future<Either<ErrorModel, List<SubCategoryEntity>>> getSubCategory(int id);
  Future<Either<ErrorModel, Unit>> addSubCategory(int categoryId, String name, String imagePath, double price);
  Future<Either<ErrorModel, Unit>> deleteSubCategory(int id);
  Future<Either<ErrorModel, Unit>> updateSubCategory(int id, String name, String imagePath,double price);
}

