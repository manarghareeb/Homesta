import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/categories/data/datasources/category_data_source.dart';
import 'package:homesta/features/categories/data/models/category_model.dart';
import 'package:homesta/features/categories/domain/entities/category_entity.dart';
import 'package:homesta/features/categories/domain/repositories/category_repo.dart';

class CategoryRepoImp extends CategoryRepo {
  final CategoryDataSource categoryDataSource;

  CategoryRepoImp({required this.categoryDataSource});
  @override
   Future<Either<ErrorModel, List<CategoryEntity>>> getCategories()async{
     try {
final List<CategoryModel> categories=  await categoryDataSource.getCategories(); 
return right(categories); 
} on ServerException catch (e) {
return left(e.errModel);
}

    }
    
      @override
      Future<Either<ErrorModel, List<CategoryEntity>>> searCategoty(String query)async {
     try {
final List<CategoryModel> categories=  await categoryDataSource.searchCategory(query); 
return right(categories); 
} on ServerException catch (e) {
return left(e.errModel);
}
      }
    
    
    }

