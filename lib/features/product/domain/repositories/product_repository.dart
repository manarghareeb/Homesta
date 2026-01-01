import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';

import 'package:homesta/features/product/domain/entities/product_entitty.dart';
import 'package:homesta/features/product/domain/entities/review_entity.dart';

abstract class ProductRepository {
  Future<Either<ErrorModel, List<ProductEntity>>> getAllProducts();
  Future<Either<ErrorModel, List<ReviewEntity>>> getAllProductReviews(
    int productId,
  );
}
