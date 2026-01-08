import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/core/error/expections.dart';
import 'package:homesta/features/product/data/data_sources/remote_data_source/product_data_source.dart';
import 'package:homesta/features/product/data/data_sources/remote_data_source/review_data_source.dart';
import 'package:homesta/features/product/domain/entities/params/add_review_params.dart';
import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/domain/entities/review_entity.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;
  final ReviewProductDataSource reviewDataSource;
  ProductRepositoryImpl({
    required this.productDataSource,
    required this.reviewDataSource,
  });
  @override
  Future<Either<ErrorModel, List<ProductEntity>>> getAllProducts() async {
    try {
      final List<ProductEntity> products =
          await productDataSource.getProducts();
      return right(products);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<ReviewEntity>>> getAllProductReviews(
    int productId,
  ) async {
    try {
      final List<ReviewEntity> reviews = await reviewDataSource
          .getProductReviews(productId);
      return right(reviews);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, Unit>> addReview(AddReviewParams params) async {
    try {
      await reviewDataSource.addReview(params);
      return right(unit);
    } on ServerException catch (e) {
      return left(e.errModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<ProductEntity>>> getProductsByCategory({
    required int categoryId,
    required int subCategoryId,
  }) async {
    try {
    final List<ProductEntity> allProducts =
        await productDataSource.getProducts();
    final filtered = allProducts.where((p) =>
        p.categoryId == categoryId && p.subCategoryId == subCategoryId).toList();
    return right(filtered);
  } on ServerException catch (e) {
    return left(e.errModel);
  }
  }
}
