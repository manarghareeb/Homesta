import 'package:dio/dio.dart';
import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/categories/data/models/category_model.dart';
import 'package:homesta/features/categories/data/models/sub_category_model.dart';

abstract class CategoryDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> searchCategory(String query);
  Future<void> addCategory(String name, String imagePath);
  Future<void> deleteCategory(int id);
  Future<void> updateCategory(int id, String name, String imagePath);
  Future<List<SubCategoryModel>> getSubCategories(int id);
  Future<void> addSubCategory(int categoryId, String name, String imagePath, double price);
  Future<void> deleteSubCategory(int id);
  Future<void> updateSubCategory(int id, String name, String imagePath, double price);
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
// add subCategory
  @override
  Future<void> addSubCategory(int categoryId, String name, String imagePath, double price) async {
    final formData = FormData.fromMap({
      "Name": name,
      "CategoryId": categoryId,
      "Image": await MultipartFile.fromFile(imagePath),
      "Price": price,
    });

    await api.post("/api/SubCategory", data: formData);
  }

  @override
  Future<void> addCategory(String name, String imagePath) async {
    final formData = FormData.fromMap({
      "Name": name,
      "Image": await MultipartFile.fromFile(imagePath),
    });

    await api.post(
      EndPoint.addCategory,
      data: formData,
    );
  }
  @override
  Future<void> deleteCategory(int id) async {
    await api.delete("${EndPoint.deleteCategory}/$id");
  }

  @override
  Future<void> updateCategory(int id, String name, String imagePath) async {
    final formData = FormData.fromMap({
      "Name": name,
      "Image": await MultipartFile.fromFile(imagePath),
    });

    await api.patch(
      "${EndPoint.updateCategory}/$id",
      data: formData,
    );
  }

  // delete subCategory
  @override
  Future<void> deleteSubCategory(int id) async {
    await api.delete("${EndPoint.deleteSubCategory}/$id");
  }

  // update subCategory
  @override
  Future<void> updateSubCategory(int id, String name, String imagePath, double price) async {
    final formData = FormData.fromMap({
      "Name": name,
      "Image": await MultipartFile.fromFile(imagePath),
      "Price": price,
    });

    await api.patch( "${EndPoint.updateSubCategory}/$id", data: formData);
  }
}
