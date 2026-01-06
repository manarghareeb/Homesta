import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.categoryId,
    required super.name,
    required super.imagePath,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json[ApiKeys.categoryId] as int,
      name: json[ApiKeys.name] as String,
      imagePath: json[ApiKeys.imagePath] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.categoryId: categoryId,
      ApiKeys.name: name,
      ApiKeys.imagePath: imagePath,
    };
  }
}
