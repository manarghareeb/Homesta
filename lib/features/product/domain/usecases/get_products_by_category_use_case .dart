import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';

class GetProductsByCategoryUseCase {
  final ProductRepository repository;

  GetProductsByCategoryUseCase(this.repository);

  Future<Either<ErrorModel, List<ProductEntity>>> call({
    required int categoryId,
    required int subCategoryId,
  }) async {
    return await repository.getProductsByCategory(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    );
  }
}
