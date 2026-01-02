import 'package:homesta/core/api/api_keys.dart';
import 'package:homesta/features/categories/domain/entities/sub_category_entity.dart';

class SubCategoryModel extends SubCategoryEntity {
  const SubCategoryModel({
    required super.subCategoryId,
    required super.categoryId,
    required super.name,
    required super.imagePath,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      subCategoryId: json[ApiKeys.subCategoryId] as int,
      categoryId: json[ApiKeys.categoryId] as int,
      name: json[ApiKeys.name] as String,
      imagePath: json[ApiKeys.imagePath] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.subCategoryId: subCategoryId,
      ApiKeys.categoryId: categoryId,
      ApiKeys.name: name,
      ApiKeys.imagePath: imagePath,
    };
  }
}
