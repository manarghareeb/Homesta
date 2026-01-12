import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/categories/data/datasources/category_data_source.dart';
import 'package:homesta/features/categories/data/models/category_model.dart';
import 'package:homesta/features/categories/data/models/sub_category_model.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';
import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';
import 'package:homesta/features/categories/domain/repositories/category_repo.dart';

class CategoryRepoImp extends CategoryRepo {
  final CategoryDataSource categoryDataSource;

  CategoryRepoImp({required this.categoryDataSource});
  @override
  Future<Either<ErrorModel, List<CategoryEntity>>> getCategories() async {
    try {
      final List<CategoryModel> categories =
          await categoryDataSource.getCategories();
      return right(categories);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<CategoryEntity>>> searCategoty(
    String query,
  ) async {
    try {
      final List<CategoryModel> categories = await categoryDataSource
          .searchCategory(query);
      return right(categories);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<SubCategoryEntity>>> getSubCategory(
    int id,
  ) async {
    try {
      final List<SubCategoryModel> categories = await categoryDataSource
          .getSubCategories(id);
      return right(categories);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, Unit>> addSubCategory(int categoryId, String name, String imagePath, double price) async {
    try {
      await categoryDataSource.addSubCategory(categoryId, name, imagePath, price);
      return right(unit);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, Unit>> addCategory(String name, String imagePath) async {
    try {
      await categoryDataSource.addCategory(name, imagePath);
      return right(unit);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }
  @override
  Future<Either<ErrorModel, Unit>> deleteCategory(int id) async {
    try {
      await categoryDataSource.deleteCategory(id);
      return right(unit);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, Unit>> updateCategory(int id, String name, String imagePath) async {
    try {
      await categoryDataSource.updateCategory(id, name, imagePath);
      return right(unit);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, Unit>> deleteSubCategory(int id) async {
    try {
      await categoryDataSource.deleteSubCategory(id);
      return right(unit);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, Unit>> updateSubCategory(int id, String name, String imagePath, double price) async {
    try {
      await categoryDataSource.updateSubCategory(id, name, imagePath, price);
      return right(unit);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }
}
