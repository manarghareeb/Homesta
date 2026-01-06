import 'package:dartz/dartz.dart';
import 'package:homesta/core/error/error_model.dart';
import 'package:homesta/features/product/domain/entities/review_entity.dart';
import 'package:homesta/features/product/domain/repositories/product_repository.dart';

class GetProductReviewUseCase {
  final ProductRepository productRepository;

  GetProductReviewUseCase({required this.productRepository});
  Future<Either<ErrorModel, List<ReviewEntity>>> call(int productId) =>
      productRepository.getAllProductReviews(productId);
}
