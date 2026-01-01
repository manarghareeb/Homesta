import 'package:homesta/core/api/api_consumer.dart';
import 'package:homesta/core/api/end_ponits.dart';
import 'package:homesta/features/categories/data/models/category_model.dart';

abstract class CategoryDataSource {
  Future<List<CategoryModel>> getCategories();
    Future<List<CategoryModel>> searchCategory(String query);
}
class CategoryDataSourceImpl implements CategoryDataSource {
  final ApiConsumer api;

  CategoryDataSourceImpl({required this.api});
  @override
  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> categories=[];
 final  respose = await api.get(EndPoint.getAllCategory);
 for(var category in respose){
   categories.add(CategoryModel.fromJson(category));
 }
 return categories;
     }
     
       @override
       Future<List<CategoryModel>> searchCategory(String query)async {
        List<CategoryModel> categories=[];
 final  respose = await api.get("${EndPoint.searchCategory}?Keword=$query");
 for(var category in respose){
   categories.add(CategoryModel.fromJson(category));
 }
 return categories;
       }
}