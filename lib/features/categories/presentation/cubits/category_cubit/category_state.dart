import 'package:homesta/features/categories/domain/entities/category_entity.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryEntity> categories;

  CategorySuccess(this.categories);
}

class CategoryFailure extends CategoryState {
  final String message;

  CategoryFailure(this.message);
}
