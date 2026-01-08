import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';

abstract class SubCategoryState {}

class SubCategoryInitial extends SubCategoryState {}

class SubCategoryLoading extends SubCategoryState {}

class SubCategorySuccess extends SubCategoryState {
  final List<SubCategoryEntity> categories;

  SubCategorySuccess(this.categories);
}

class SubCategoryFailure extends SubCategoryState {
  final String message;

  SubCategoryFailure(this.message);
}
