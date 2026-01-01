import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/categories/data/models/category_model.dart';
import 'package:homesta/features/categories/data/models/sub_category_model.dart';

abstract class CategoryDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> searchCategory(String query);
  Future<List<SubCategoryModel>> getSubCategories(int id);
}

class CategoryDataSourceImpl implements CategoryDataSource {
  final ApiConsumer api;

  CategoryDataSourceImpl({required this.api});
  @override
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories = [];
    final respose = await api.get(EndPoint.getAllCategory);
    for (var category in respose) {
      categories.add(CategoryModel.fromJson(category));
    }
    return categories;
  }

  @override
  Future<List<CategoryModel>> searchCategory(String query) async {
    List<CategoryModel> categories = [];
    final respose = await api.get("${EndPoint.searchCategory}?Keyword=$query");
    for (var category in respose) {
      categories.add(CategoryModel.fromJson(category));
    }
    return categories;
  }

  @override
  Future<List<SubCategoryModel>> getSubCategories(int id) async {
    List<SubCategoryModel> subCategories = [];
    final respose = await api.get("${EndPoint.getSubCategory}/$id");
    for (var subCategory in respose) {
      subCategories.add(SubCategoryModel.fromJson(subCategory));
    }
    return subCategories;
  }
}
